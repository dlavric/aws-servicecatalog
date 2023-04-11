# aws-servicecatalog
This is a test repository with some sample TF code to test the resource aws_servicecatalog_provisioned_product

## Instructions

### Prerequisites

- [X] [Terraform](https://www.terraform.io/downloads)

## How to Use this Repo

- Clone this repository:
```shell
git clone git@github.com:dlavric/aws-servicecatalog.git
```

- Go to the directory where the repo is stored and make sure the `main.tf` file is there too:
```shell
cd aws-servicecatalog
```

- Run `terraform init`, to download any external dependency
```shell
terraform init
```

- Apply the changes with Terraform
```shell
terraform apply
```

This is the output for applying the changes:
```shell
Apply complete! Resources: 9 added, 0 changed, 0 destroyed.
```

- Destroy the instance
```shell
terraform destroy
```


## Reference Documentation
- [AWS provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [Resource aws_servicecatalog_provisioned_product](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/servicecatalog_provisioned_product)

