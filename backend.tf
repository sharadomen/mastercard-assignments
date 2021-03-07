terraform {
  backend "s3" {
    bucket = "statefilelocktf-store"
    key    = "remotebackendlockstate.tfstate"
    region = "us-east-1" 
  }
}
