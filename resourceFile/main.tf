# resource "aws_s3_bucket" "first_bucket" {
#   bucket = var.bucket_name
#   acl    = var.public_private
#     website {
#     index_document = "index.html"
#     error_document = "error.html"
#   }
# }
# resource "aws_s3_bucket_object" "object" {
#   bucket = aws_s3_bucket.first_bucket.bucket
#   key    = var.key_name
#   source = var.source_file
#   acl    = var.public_private
#   etag = filemd5(var.etag_file)
# }

resource "aws_s3_bucket" "first_bucket" {
  bucket = var.bucket_name
  acl    = var.public_private
    website {
    index_document = "index.html"
    error_document = "error.html"
  }
}
resource "aws_s3_bucket_object" "object1" {
for_each = fileset("website/", "*")
bucket = aws_s3_bucket.first_bucket.id
acl    = var.public_private
key = each.value
source = "website/${each.value}"
etag = filemd5("website/${each.value}")
}