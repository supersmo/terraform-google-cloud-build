variable "DEPLOY_PROJECT" {
  description = "The project we are deploying to"
}

variable "ENVIRONMENT" {
  description = "The environment we are deploying to."
  default = "snd" # A default value of 'snd' for sandbox is added for simplicity for hackathon.
}

variable "HACKATHON_TEAM_NAME" {
  description = "The team owning the resource"
}