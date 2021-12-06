provider "aws" {
  region = "us-east-1"
  allowed_account_ids = [292842536810]
  profile = "terraform"
  shared_credentials_file = "~/.aws/credentials"


}