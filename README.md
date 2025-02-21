Hi,
In this devops project i have used Terraform and AWS Cloud to set up static website hosting.
With the help of this project i learnt how to use AWS Providers, Use S3 Bucket, how to upload images in S3 on AWS using terraform and host any static website in  just a fraction of seconds.

Steps:
1. Having AWS CLI and terraform installed 
2. Creating S3 Bucket with AWS Providers documentation (https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket)
3. Enabling the static Website hosting in S3 bucket properties
4. Making basic index.html and error.html files mentioning your portfolio
5. Uploading the website files "index.html" & "error.html" to objects in S3 Bucket
6. Enabling the public access
7. Accessing the website from S3 bucket website URL


Terraform commands used 
1. Terraform init
2. Terraform plan
3. Terraform apply OR Terraform apply -auto-approve (skips the step on entering "yes" when we enter terraform apply)
4. Terraform destroy
