terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.83.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}




# Fetching an existing security group
data "aws_security_group" "selected" {
  id = "sg-08d7bd9b987ad5b0c" # Your existing security group ID
}

# Create an AMI from an existing instance (This is your original configuration)
resource "aws_ami_from_instance" "Backend-AMI" {
  name               = "Backendami"
  source_instance_id = "i-0009b5e98fa41c36a" # The instance you're creating the AMI from

  tags = {
    Name = "Backendami"
  }
}

# Launching a new EC2 instance using the AMI created from the existing instance
resource "aws_instance" "new_instance" {
  ami           = aws_ami_from_instance.Backend-AMI.id # Use the AMI ID from the created AMI resource
  instance_type = "t2.micro"                           # Choose the appropriate instance type

  # Security group association
  vpc_security_group_ids = [data.aws_security_group.selected.id]

  subnet_id = "subnet-0b3bde926e431b663" # Specify the subnet where you want to launch the instance

  tags = {
    Name = "EC2-from-Existing-AMI"
  }
}






