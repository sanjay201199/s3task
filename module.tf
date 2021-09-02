module "create_bucket_object" {
  source = "./resourceFile"
  bucket_name="aws-service-page"
  public_private="public-read"
  # key_name="index.html"
  # source_file = "./resourceFile/index.html"
  # etag_file="./resourceFile/index.html"
}