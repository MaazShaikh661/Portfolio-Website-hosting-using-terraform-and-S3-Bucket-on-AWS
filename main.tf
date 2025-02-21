#create S3 Bucket

resource "aws_s3_bucket" "maazbucket" {
  bucket = var.bucketname

}


#aws_s3_bucket_ownership_controls

resource "aws_s3_bucket_ownership_controls" "maazbucket" {
  bucket = aws_s3_bucket.maazbucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}



#aws_s3_bucket_public_access_block

resource "aws_s3_bucket_public_access_block" "maazbucket" {
  bucket = aws_s3_bucket.maazbucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}



#aws_s3_bucket_acl

resource "aws_s3_bucket_acl" "maazbucket" {
  depends_on = [
    aws_s3_bucket_ownership_controls.maazbucket,
    aws_s3_bucket_public_access_block.maazbucket,
  ]

  bucket = aws_s3_bucket.maazbucket.id
  acl    = "public-read"
}




 #aws_s3_object for index file 
 resource "aws_s3_object" "index"{
  bucket = aws_s3_bucket.maazbucket.id
  key = "index.html"
  source = "index.html"
  content_type = "text/html"

 }


#For Error file 
  resource "aws_s3_object" "error"{
  bucket = aws_s3_bucket.maazbucket.id
  key = "error.html"
  source = "error.html"
  content_type = "text/html"

 }

#For image 
 resource "aws_s3_object" "Maaz-image" {
  bucket = aws_s3_bucket.maazbucket.id
  key = "Maaz-image.jpeg"
  source = "Maaz-image.jpeg"
 }




#aws_s3_bucket_website_configuration


 resource "aws_s3_bucket_website_configuration" "maazwebsite" {
  bucket = aws_s3_bucket.maazbucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

  depends_on = [aws_s3_bucket_acl.maazbucket]
 }




#Policy
 resource "aws_s3_bucket_policy" "public_read_access" {
  bucket = aws_s3_bucket.maazbucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "arn:aws:s3:::${aws_s3_bucket.maazbucket.id}/*"
      }
    ]
  })
}
