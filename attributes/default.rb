
default["chef_server_ha_aws_provisioner"]["config"] = {}

default["chef_server_ha_aws_provisioner"]["package_url"] = nil
default["chef_server_ha_aws_provisioner"]["package_version"] = :latest
default["chef_server_ha_aws_provisioner"]["package_channel"] = :current
# Stable builds don't exist yet, but when they do:
# default['chef_server_ha_aws_provisioner']['package_channel'] = :stable
