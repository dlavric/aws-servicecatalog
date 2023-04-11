# aws-servicecatalog
This is a test repository with some sample TF code to test the resource aws_servicecatalog_provisioned_product

## Instructions

### Prerequisites

- [X] [Terraform](https://www.terraform.io/downloads)
- [X] [AWS Account](https://aws.amazon.com/free/?trk=65c60aef-03ac-4364-958d-38c6ccb6a7f7&sc_channel=ps&ef_id=CjwKCAjwitShBhA6EiwAq3RqA28CCjtoE0OWLVX286WcnQ9MsCmEE3LHTjxLe6GwciLGCIpr82he9hoC5FIQAvD_BwE:G:s&s_kwcid=AL!4422!3!458573551357!e!!g!!aws%20account!10908848282!107577274535&all-free-tier.sort-by=item.additionalFields.SortRank&all-free-tier.sort-order=asc&awsf.Free%20Tier%20Types=*all&awsf.Free%20Tier%20Categories=*all)

## How to Use this Repo

- Clone this repository:
```shell
git clone git@github.com:dlavric/aws-servicecatalog.git
```

- Go to the directory where the repo is stored and make sure the `main.tf` file is there too:
```shell
cd aws-servicecatalog
```

- Export your AWS environment variables to connect to your AWS account
```shell
export AWS_ACCESS_KEY_ID=
export AWS_SECRET_ACCESS_KEY=
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

