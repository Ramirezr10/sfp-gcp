import os
from google.cloud import storage

def verify_infrastructure(bucket_name):

	"""
	This script tests the 'Least Privilege' we set in Terraform.
	It should be able to LIST files, but if we tried to DELETE the bucket,
	if should fail.

	"""
	# storage.Client() auto finds you "Application Default Credentials"
	client = storage.Client()

	try:
		print(f"--- Connecting to Bucket: {bucket_name} ---")
		bucket = client.get_bucket(bucket_name)

		# attempt to list files (object viewer role)
		blobs = bucket.list_blobs()

		print("Success! File list:")
		count = 0
		for blob in blobs:
			print(f" [FILE] {blob.name}")
			count += 1


		if count == 0:
			print( " (Bucket is empty, but connectiion is successful)")

	except Exception as e:
		print(f"Permission Denied or Error: {e}")

if __name__ == "__main__":
	# Use the bucket name you defined in terraform
	MY_BUCKET_NAME = 'sfp-ops-1'
	verify_infrastructure(MY_BUCKET_NAME) 