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




resource "aws_servicecatalog_portfolio" "portfolio" {
  name          = "danielaporto"
  description   = "List of my organizations apps"
  provider_name = "dani"
}

resource "aws_servicecatalog_product" "example" {
  name  = "daniela"
  owner = "daniela-owner"
  type  = "CLOUD_FORMATION_TEMPLATE"

  provisioning_artifact_parameters {
    template_physical_id = "arn:aws:cloudformation:eu-central-1:323533494701:stack/daniela-stack/e90a5a50-d452-11ed-9880-064f8d29b592"
    type                 = "CLOUD_FORMATION_TEMPLATE"
    #name                 = "v9"
  }
}

resource "aws_servicecatalog_product_portfolio_association" "association" {
  portfolio_id = aws_servicecatalog_portfolio.portfolio.id
  product_id   = aws_servicecatalog_product.example.id
}

resource "aws_servicecatalog_product_portfolio_association" "association_rule" {
  product_id   = aws_servicecatalog_product.example.id
  portfolio_id = aws_servicecatalog_portfolio.portfolio.id
}

# resource "aws_servicecatalog_portfolio_share" "example" {
#   principal_id = "323533494701"
#   portfolio_id = aws_servicecatalog_portfolio.portfolio.id
#   type         = "ORGANIZATION_MEMBER_ACCOUNT"
# }

# data "aws_servicecatalog_launch_paths" "path" {
#   product_id = aws_servicecatalog_product.example.id
# }

resource "aws_servicecatalog_provisioning_artifact" "artifact" {
  name                 = "v9"
  product_id           = aws_servicecatalog_product.example.id
  type                 = "CLOUD_FORMATION_TEMPLATE"
  template_physical_id = "arn:aws:cloudformation:eu-central-1:323533494701:stack/daniela-stack/e90a5a50-d452-11ed-9880-064f8d29b592"
}

resource "aws_servicecatalog_provisioned_product" "example" {
  name       = "daniela"
  product_id = aws_servicecatalog_product.example.id
  #   path_id                    = data.aws_servicecatalog_launch_paths.path.summaries[0].path_id
  provisioning_artifact_name = "v9"
}