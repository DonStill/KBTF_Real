output "sgid" {
  value = aws_security_group.kbsg.id
}

output "launchtemp" {
  value = aws_launch_template.launchtemp.id
}

output "launchtemp_version" {
  value = aws_launch_template.launchtemp.latest_version
}
