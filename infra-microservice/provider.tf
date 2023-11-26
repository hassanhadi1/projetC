provider "aws" {
  region = "eu-west-1"
  default_tags {
    tags = {
      owner = "hhassan@thenuumfactory.fr"
      ephemere = "non"
      entity = "numfactory"
    }
  }
}

terraform {
  backend "s3" {
    bucket = "Hadi-s3"
    key = "drupal.tfstate"
    region = "eu-west-1"
  }
}