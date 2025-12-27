#GCP variables

variable "project_id" {
  type        = string
  description = "serverless_file_processor"
}

variable "region" {
  type        = string
  default     = "us-central1"
  description = "primary region for resources"
}

variable "bucket_name" {
  type        = string
  description = "sfp_ops"

}
