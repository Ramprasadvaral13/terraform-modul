resource "aws_security_group" "test" {
    name = "test-sg"
    description = "tes"
    vpc_id = var.vpc_id
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
}

resource "aws_launch_template" "test-lt" {
    instance_type = var.instance_type
    image_id = var.image_id
    vpc_security_group_ids = [ aws_security_group.test.id ]
    key_name = var.key_name

    iam_instance_profile {
      
    }
block_device_mappings {
  device_name = "/dev/xvda"
  ebs {
    
    volume_size = var.volume_size
    volume_type = "gp3"
    delete_on_termination = true
  }
}

  
}