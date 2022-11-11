Follow the steps below to delte the S3 bucket and DynamoDB table

- Remove the backend configuration, rerun terraform init to copy the the Terraform state back to your local disk
    Run terraform init -migrate-state
- Run terraform destroy to delete the S3 bucket and DynamoDB table