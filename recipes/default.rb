#
# Cookbook Name:: chef-server-ha-aws-provisioner
# Recipe:: default
#
# Copyright (c) 2014 The Authors, All Rights Reserved.

# Build the CSHAP server with this recipe if you use the node attributes.
# If you wish to not use attributes, you may use the awsha_provisioner
# resource/provider within your cookbook and pass attributes to the resource.

awsha_provisioner "chef-server-ha-provisioning" do
  config node["chef_server_ha_aws_provisioner"]["config"].to_hash
end
