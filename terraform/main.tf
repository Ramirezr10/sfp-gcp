# 1. Create the Storage Bucket (Infrastructure)

resource "google_storage_bucket" "input_bucket" {
  name          = var.bucket_name
  location      = var.region
  force_destroy = true #deletes full buckets

  public_access_prevention = "enforced" # security 

  uniform_bucket_level_access = true

}

# 2. Create a Service Account (Identity)
# This is what the Python code will "wear" to get permissions

resource "google_service_account" "function_sa" {
  account_id   = "file-processor-sa"
  display_name = "service account for cloud function"

}

# 3. Give the Service Account "Object Viewer" permission on the bucket
# This is "Least Privilege" - it can see files but not delete the bucket

resource "google_storage_bucket_iam_binding" "bucket_viewer" {
  bucket  = google_storage_bucket.input_bucket.name
  role    = "roles/storage.objectViewer"
  members = ["serviceAccount:${google_service_account.function_sa.email}"]

}
