
resource "aws_instance" "local_cont" {
    ami= "ami-089b4ef4a241e114e"
    instance_type = "t2.micro"
    subnet_id = [var.local_pbsub]
    security_groups = [var.sec_local]

    tags = {
        name = "my-cont"
    }
}