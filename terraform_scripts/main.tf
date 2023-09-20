provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "terraform-instance" {
  ami           = "ami-09988af04120b3591"
  instance_type = "t2.micro"
  key_name      = "test-server-key-east"
  availability_zone = "us-east-1a"

  tags = {
    Name = "new-terraform-server"
  }
}

#Output variables

output "instance_id" {
  value = aws_instance.terraform-instance.id
  description = "The ID of the created EC2 instance"
  sensitive = true   //this hides output in the terminal
}

output "public_ip" {
  value = aws_instance.terraform-instance.public_ip
  description = "The public IP of the created EC2 instance"
}