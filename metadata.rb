name             "chef-server-ha-aws-provisioner"
maintainer       "Irving Popovetsky"
maintainer_email "irving@chef.io"
license          "all_rights"
description      "Installs and Configures Chef Server HA Provisioning (AWS) from the Omnibus packages on packagecloud.io"
source_url       "https://github.com/irvingpop/chef-server-ha-aws-provisioner"
issues_url       "https://github.com/irvingpop/chef-server-ha-aws-provisioner/issues"
version          "0.1.0"

depends "chef-ingredient"
depends "hostsfile"
depends "fancy_execute"

# Temporary hacky thing to do until a new build of mixlib-install has been published to rubygems
depends "gem_specific_install"
