# key pair

resource "tls_private_key" "tls" {
  algorithm = "RSA"
  rsa_bits = 2048
}

resource "aws_key_pair" "key" {
  key_name = "utc-key"
  public_key = tls_private_key.tls.public_key_openssh
}

resource "local_file" "key1" {
  filename = "devkey.pem"
  content = tls_private_key.tls.private_key_pem
}