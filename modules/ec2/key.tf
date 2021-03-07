resource "aws_key_pair" "envkey" {
  key_name   = "envkey"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}