# This script validates the meta dictionary in YAML files.

from schema import Or, Schema, SchemaError
import yaml
import sys

# Define the accepted values for the meta.domain, meta.owners, and meta.criticality keys.
# Retrieved from [redacted] on 2024-04-28

accepted_domains = ['transaction_core', 'user']
accepted_owners = ['bi', 'dwh']
accepted_criticality = [None, "low", "medium", "high"]

# Define the schema for valid meta dicts
schema = Schema({
    "models": [{
        "meta": {
            "domain": Or(*accepted_domains, error=f"meta.domain must be one of the following:\n{accepted_domains}"),
            "owner": Or(*accepted_owners, error=f"meta.owner must be one of the following:\n{accepted_owners}"),
            "criticality": Or(*accepted_criticality, error=f"meta.criticality must be one of the following:\n{accepted_criticality}"),
            "contains_pii": Or(bool, error="contains_pii must be a boolean")
        }
    }]
}, ignore_extra_keys=True)

def validate_yaml(filenames):
    all_valid = True
    errors = []
    for filename in filenames:
        with open(filename, 'r') as file:
            try:
                yaml_data = yaml.safe_load(file)
                schema.validate(yaml_data)
                print(f"Validation successful for {filename}")
            except (yaml.YAMLError, SchemaError) as e:
                errors.append(f"{filename}'s meta dictionary contains errors:\n{e}")
                all_valid = False  # Mark that validation failed for at least one file

    if not all_valid:
        for error in errors:
            print(f'{error}\n\nSee {sys.argv[0]} for more information.')
        sys.exit(1)  # Exit with non-zero exit code if validation fails for any file

if __name__ == "__main__":
    # Check if filenames are provided as arguments
    if len(sys.argv) < 2:
        print(f"Usage: python {sys.argv[0]} <filename1> <filename2> ... <filenameN>")
        sys.exit(1)

    # Validate the YAML files based on the filenames provided as arguments
    filenames = sys.argv[1:]
    validate_yaml(filenames)
