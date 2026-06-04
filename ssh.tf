resource "aws_key_pair" "cmtr-m0n4rtob-keypair" {
  key_name   = "cmtr-m0n4rtob-keypair"
  public_key = var.ssh_key

  tags = {
    Project = "epam-tf-lab"
    ID      = "cmtr-m0n4rtob"
  }
}
