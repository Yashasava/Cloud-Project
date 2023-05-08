provider "aws" {
region = "us-east-1"
access_key = var.acc_key
secret_key = var.Sec_key

}

resource "aws_instance" "my1" {
ami = "ami-07d3a50bd29811cd1"
instance_type = "t2.micro"

tags = {
Name = "cloud1_project"
}
}

#s3
resource "aws_s3_bucket" "example" {
  bucket = "my-bucket-etp8839"
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

# IAM role
resource "aws_iam_role" "atc-s3-access-keys" {
    name = "atc-s3-access-keys"
    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
        {
            Effect = "Allow"
            Principal = {
            Service = "ec2.amazonaws.com"
            }
            Action = "sts:AssumeRole"
        }
    ]
  })
}

# Policy Atachement for IAM role
resource "aws_iam_role_policy_attachment" "s3full_access" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  role       = aws_iam_role.atc-s3-access-keys.id
}


