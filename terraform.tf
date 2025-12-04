terraform {
  required_version = ">= 1.14.1"
  required_providers {
    pagerduty = {
      source  = "pagerduty/pagerduty"
      version = "~> 3.30"
    }
  }
}

