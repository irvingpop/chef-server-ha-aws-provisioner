require "chef/resource"
require "chef/provider"

class Chef
  class Resource
    # Missing top-level class documentation comment
    class AwshaProvisioner < Chef::Resource
      def initialize(name, run_context = nil)
        super
        @resource_name = :awsha_provisioner
        @provider = Chef::Provider::AwshaProvisioner
        @action = :create
        @allowed_actions = [:create]
      end

      def config(arg = nil)
        set_or_return(:config, arg, kind_of: [Hash])
      end
    end
  end
end

class Chef
  class Provider
    # Missing top-level class documentation comment
    class AwshaProvisioner < Chef::Provider::LWRPBase
      use_inline_resources if defined?(use_inline_resources)

      def whyrun_supported?
        true
      end

      action :create do
        hostsfile_entry node["ipaddress"] do
          hostname node["hostname"]
          not_if "grep #{node['hostname']} /etc/hosts"
        end

        directory "/etc/chef-server-ha-provisioning" do
          owner "root"
          group "root"
          mode 00750
          recursive true
          action :create
        end

        template "/etc/chef-server-ha-provisioning/chef-server.rb" do
          owner "root"
          group "root"
          mode "0644"
          source "chef-server.rb.erb"
          notifies :reconfigure, "chef_ingredient[chef-server-ha-provisioning]"
        end

        # Temporary hacky thing to do until a new build of mixlib-install has been published to rubygems
        include_recipe "gem_specific_install"
        gem_specific_install "mixlib-install" do
          repository "https://github.com/chef/mixlib-install.git"
          revision "master"
        end

        if node["chef_server_ha_aws_provisioner"]["package_url"]
          pkgname = ::File.basename(node["chef_server_ha_aws_provisioner"]["package_url"])
          cache_path = ::File.join(Chef::Config[:file_cache_path], pkgname).gsub(/~/, "-")

          # recipe
          remote_file cache_path do
            source node["chef_server_ha_aws_provisioner"]["package_url"]
            mode "0644"
          end
        end

        # case node['platform_family']
        # when 'debian'
        #   node.default['apt-chef']['repo_name'] = node['chef_server_ha_aws_provisioner']['package_repo']
        # when 'rhel'
        #   node.default['yum-chef']['repositoryid'] = node['chef_server_ha_aws_provisioner']['package_repo']
        # end

        chef_ingredient "chef-server-ha-provisioning" do
          # Prefer package_url if set over custom repository
          if node["chef_server_ha_aws_provisioner"]["package_url"]
            Chef::Log.info "Using CSHAP package source: #{node['chef_server_ha_aws_provisioner']['package_url']}"
            package_source cache_path
          else
            Chef::Log.info "Using CHEF's public repository #{node['chef_server_ha_aws_provisioner']['package_repo']}"
            version node["chef_server_ha_aws_provisioner"]["package_version"]
            channel node["chef_server_ha_aws_provisioner"]["package_channel"]
          end
        end
      end
    end
  end
end
