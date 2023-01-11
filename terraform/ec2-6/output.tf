output "public_ip" {
  description = "Direccion IP Publica de servidor"
  value = "${aws_instance.server.*.public_ip}"
}