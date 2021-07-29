#  Docs: https://www.terraform.io/docs/providers/aws/index.html

#  If AWS_PROFILE and AWS_REGION is set, then the provider is optional.  Here's an example anyway:

provider "aws" {
  region  = "<%= ENV["AWS_REGION"] %>"
  access_key  = "<%= ENV["AWS_ACCESS_KEY_ID"] %>"
  secret_key  = "<%= ENV["AWS_SECRET_ACCESS_KEY"] %>"
}
