provider "aws" {
  region = "us-east-1"
}

provider "vault" {
  address = "http://3.91.93.212:8200"
  skip_child_token = true

  auth_login {
    path = "auth/approle/login"

    parameters = {
      role_id = "88a1cecb-7ff3-853a-32ea-02357805c54b"
      secret_id = "91e6f242-006b-8035-1087-bb913f084a4e"
    }
  }
}

data "vault_kv_secret_v2" "example" {
    mount = "kv"
    name = "test-secret"
}

resource "aws_instance" "example" {
  ami           = "ami-053b0d53c279acc90"
  instance_type = "t2.micro"

  tags = {
    Name = "test"
    Secret = data.vault_kv_secret_v2.example.data["username"]
  }
}