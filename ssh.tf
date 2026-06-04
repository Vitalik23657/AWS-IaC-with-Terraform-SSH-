resource "aws_key_pair" "cmtr_m0n4rtob_keypair" {
  key_name   = local.key_pair_name
  public_key = var.ssh_key

  tags = local.common_tags
}
