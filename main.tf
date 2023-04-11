resource "aws_servicecatalog_portfolio" "test" {
  name          = "danielalavric"
  description   = "danielalavric"
  provider_name = "danielalavric"
}

resource "aws_servicecatalog_constraint" "test" {
  description  = "danielalavric"
  portfolio_id = aws_servicecatalog_product_portfolio_association.test.portfolio_id
  product_id   = aws_servicecatalog_product_portfolio_association.test.product_id
  type         = "RESOURCE_UPDATE"

  parameters = jsonencode({
    Version = "2.0"
    Properties = {
      TagUpdateOnProvisionedProduct = "ALLOWED"
    }
  })
}

resource "aws_servicecatalog_product_portfolio_association" "test" {
  portfolio_id = aws_servicecatalog_principal_portfolio_association.test.portfolio_id
  product_id   = aws_servicecatalog_product.test.id
}

data "aws_caller_identity" "current" {}

data "aws_iam_session_context" "current" {
  arn = data.aws_caller_identity.current.arn
}

resource "aws_servicecatalog_principal_portfolio_association" "test" {
  portfolio_id  = aws_servicecatalog_portfolio.test.id
  principal_arn = data.aws_iam_session_context.current.issuer_arn # unfortunately, you cannot get launch_path for arbitrary role - only caller
}

data "aws_servicecatalog_launch_paths" "test" {
  product_id = aws_servicecatalog_product_portfolio_association.test.product_id
}

resource "aws_s3_bucket" "test" {
  bucket        = "danielalavric"
  force_destroy = true
}

resource "aws_s3_bucket_acl" "test" {
  bucket = aws_s3_bucket.test.id
  acl    = "private"
}

resource "aws_s3_object" "test" {
  bucket = aws_s3_bucket.test.id
  key    = "danielalavric.json"

  content = jsonencode({
    AWSTemplateFormatVersion = "2010-09-09"

    Parameters = {
      VPCPrimaryCIDR = {
        Type = "String"
      }
      LeaveMeEmpty = {
        Type        = "String"
        Description = "Make sure that empty values come through. Issue #21349"
      }
    }

    "Conditions" = {
      "IsEmptyParameter" = {
        "Fn::Equals" = [
          {
            "Ref" = "LeaveMeEmpty"
          },
          "",
        ]
      }
    }

    Resources = {
      MyVPC = {
        Type      = "AWS::EC2::VPC"
        Condition = "IsEmptyParameter"
        Properties = {
          CidrBlock = { Ref = "VPCPrimaryCIDR" }
        }
      }
    }

    Outputs = {
      VpcID = {
        Description = "VPC ID"
        Value = {
          Ref = "VPCPrimaryCIDR"
        }
      }
    }
  })
}

resource "aws_servicecatalog_product" "test" {
  description         = "danielalavric"
  distributor         = "distributör"
  name                = "danielalavric"
  owner               = "ägare"
  type                = "CLOUD_FORMATION_TEMPLATE"
  support_description = "danielalavric"
  support_email       = "no-reply@hashicorp.com"
  support_url         = "http://danielalavric.com"

  provisioning_artifact_parameters {
    description                 = "artefaktbeskrivning"
    disable_template_validation = true
    name                        = "danielalavric"
    template_url                = "https://${aws_s3_bucket.test.bucket_regional_domain_name}/${aws_s3_object.test.key}"
    type                        = "CLOUD_FORMATION_TEMPLATE"
  }

  tags = {
    Name = "danielalavric"
  }
}

resource "aws_servicecatalog_provisioned_product" "test" {
  name                       = "danielalavric"
  product_id                 = aws_servicecatalog_product.test.id
  provisioning_artifact_name = "danielalavric"
  path_id                    = data.aws_servicecatalog_launch_paths.test.summaries[0].path_id

  provisioning_parameters {
    key   = "VPCPrimaryCIDR"
    value = "10.1.0.0/16"
  }

  provisioning_parameters {
    key   = "LeaveMeEmpty"
    value = ""
  }

}
