provider "aws" {
  access_key                  = "test"
  secret_key                  = "test"
  region                      = var.aws_region[var.environment[terraform.workspace]]
  s3_use_path_style           = false
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true


  default_tags {
    tags = {
      env              = var.environment[terraform.workspace]
      project          = "inv"
      TerraformManaged = true
      Owner            = "Investigate"
    }
  }

  endpoints {
    apigateway     = "http://localhost:31566"
    apigatewayv2   = "http://localhost:31566"
    cloudformation = "http://localhost:31566"
    cloudwatch     = "http://localhost:31566"
    dynamodb       = "http://localhost:31566"
    ec2            = "http://localhost:31566"
    es             = "http://localhost:31566"
    elasticache    = "http://localhost:31566"
    firehose       = "http://localhost:31566"
    iam            = "http://localhost:31566"
    kinesis        = "http://localhost:31566"
    lambda         = "http://localhost:31566"
    rds            = "http://localhost:31566"
    redshift       = "http://localhost:31566"
    route53        = "http://localhost:31566"
    s3             = "http://s3.localhost.localstack.cloud:31566"
    secretsmanager = "http://localhost:31566"
    ses            = "http://localhost:31566"
    sns            = "http://localhost:31566"
    sqs            = "http://localhost:31566"
    ssm            = "http://localhost:31566"
    stepfunctions  = "http://localhost:31566"
    sts            = "http://localhost:31566"
  }
}