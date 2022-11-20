provider "aws" {
  region = "us-east-1"
}

provider "random" {}

resource "random_pet" "name" {}

resource "aws_instance" "web" {
  ami           = "ami-0b0dcb5067f052a63"
  instance_type = "t2.micro"
  user_data     = file("init-script.sh")
  key_name      = "my-key-pair2"

  tags = {
    Name = random_pet.name.id
  }
}

resource "aws_key_pair" "deployer" {
  key_name   = "my-key-pair2"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDUsg8HoD+juIPyPaw98QLQC8t7CONIYPLUIka9x8EhmkFxs9/v6Rce6zq16TYX/a7QMJWBTE2rtqH18C3E0pgQbQbc4g9VkJd8ywObNgzMLDmrcahlZfeDGag0RsMoKA5S9p1xRgRc/9aoxnl+L3+XQXhlUjt78FsGyq1Qgni+VkYkAeEUleGP93TGEFmFtwkqA40MM3J3J9ADzo11cAUjsE+PNrQiLxEwgedCuFvbEU8BXxLBLyA18lRZnW1Q4YwhK/xPoL5pqWE7ku9pFOuYM4UU1SFqPFdM9aui9yO2BtTvlU5QKtgEpwGEtzrtmmDXkmOX1mJ27TyyeDNmLZB1hHMmYa6xMBnTVvbyBBIXADDahyraPTcaA9vKL06v7x+5v3HvI2aXo5nJBrehPHen4fUytE3p6lIaKW9b9i2VZ4ScNO+W9gbhIPtpbT4fCA62wM4fvCCC1Cckb9QgFjWghLDwR6HlvNNnzLEX1jlQDcxc3lzfqrRkS9FEvSVL/ME="
}

