resource "aws_route53_record" "www" {
  zone_id = data.aws_route53_zone.roman.id
  name    = "roman.ibrahimu.net"
  type    = "A"
  ttl     = 300
  records = [aws_instance.web.public_ip]
}