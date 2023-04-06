# resource "aws_servicecatalog_product" "example" {
#   name  = "daniela"
#   owner = "daniela-owner"
#   type  = "CLOUD_FORMATION_TEMPLATE"

#   provisioning_artifact_parameters {
#     template_physical_id = "arn:aws:cloudformation:eu-central-1:938620692197:stack/daniela-test-stack/b14c4d30-d3c1-11ed-80ae-0680adcd4edc"
#     type                 = "CLOUD_FORMATION_TEMPLATE"
#   }
# }

#different AWS account



resource "aws_servicecatalog_product" "example" {
  name  = "daniela"
  owner = "daniela-owner"
  type  = "CLOUD_FORMATION_TEMPLATE"

  provisioning_artifact_parameters {
    template_physical_id = "arn:aws:cloudformation:eu-central-1:323533494701:stack/daniela-stack/e90a5a50-d452-11ed-9880-064f8d29b592"
    type                 = "CLOUD_FORMATION_TEMPLATE"
  }
}



resource "aws_servicecatalog_provisioned_product" "example" {
  name                       = "daniela"
  product_name               = "daniela"
  provisioning_artifact_name = "v9"

  provisioning_parameters {
    key   = "foo"
    value = "bar"
  }
}