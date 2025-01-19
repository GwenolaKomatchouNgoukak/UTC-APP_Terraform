# Create EC2 instance
resource "aws_instance" "serv1" {
  instance_type = "t2.micro"
  ami = "ami-0f6c2b9008cea6bed"
  key_name = aws_key_pair.key.key_name
  #security_groups = [ aws_security_group.sg.id ]
  vpc_security_group_ids = [aws_security_group.sg.id ]
  user_data = file("script.sh")
  tags = {
    Name = "utc-dev-inst"
    Team = "Cloud transformation"
    Env = "Dev"
    Created_by = "Gwenola Komatchou"
  }
  subnet_id = aws_subnet.pub1.id
}

# Create EBS Volume
resource "aws_ebs_volume" "vol1" {
  availability_zone = aws_instance.serv1.availability_zone
  size = 20
  tags = {
    Name = "devvolume"
    Team = "cloud"
  }
}

# Attach Volume

resource "aws_volume_attachment" "name" {
  device_name = "/dev/sdb"
  volume_id = aws_ebs_volume.vol1.id
  instance_id = aws_instance.serv1.id
}
