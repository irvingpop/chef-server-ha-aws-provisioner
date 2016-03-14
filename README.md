# Provisioner Node cookbook for chef-server-ha-provisioning

This cookbook installs the [Chef Server HA (for AWS) Provisioning package]() server using the packages from PackageCloud.  

# Usage

## Attributes

Set the following attributes in the [`.kitchen.local.yml`](https://github.com/irvingpop/chef-server-ha-aws-provisioner/blob/master/.kitchen.local.yml.example) or via a wrapper cookbook.  

```ruby
default['chef_server_ha_aws_provisioner']['chef_server_url'] = 'https://chefserver.mycompany.com'
default['chef_server_ha_aws_provisioner']['chef_oauth2_app_id'] = '14dfcf186221781cff51eedd5ac1616'
default['chef_server_ha_aws_provisioner']['chef_oauth2_secret'] = 'a49402219627cfa6318d58b13e90aca'
default['chef_server_ha_aws_provisioner']['chef_oauth2_verify_ssl'] = false
```

If you wish to specify a package version, a repository or a source, you can do that now:
```ruby
default['chef_server_ha_aws_provisioner']['package_version'] = '1.2.3'

# install from the repository of nightly packages
default['chef_server_ha_aws_provisioner']['package_repo'] = 'chef-current'

# OR, specify a package explicitly from a location of your choosing
default['chef_server_ha_aws_provisioner']['package_url'] = 'http://bit.ly/98K8eH'
```

If you wish to specify additional settings, you can pass them via the `default['chef_server_ha_aws_provisioner']['config']` attribute.  
Example: for custom SSL certificates define the following `config` attributes:


# License and Authors

- Author: Irving Popovetsky (<irving@chef.io>)

- Copyright (C) 2015, Chef Software, Inc. (<legal@chef.io>)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
