#
# Cookbook Name:: chef-server-ha-aws-provisioner
# Spec:: default
#
# Copyright (c) 2015 Irving Popovetsky, All Rights Reserved.

require "spec_helper"

describe "chef-server-ha-aws-provisioner::default" do
  context "When all attributes are default, it should fail because of nil checks" do
    let(:chef_run) do
      runner = ChefSpec::SoloRunner.new(platform: "redhat", version: "6.5", step_into: "awsha_provisioner")
      runner.converge(described_recipe)
    end

    before do
      stub_command("grep Fauxhai /etc/hosts").and_return("33.33.33.11 Fauxhai")
    end

    it "raises an error" do
      expect { chef_run }
    end
  end

end
