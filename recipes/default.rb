#
# Cookbook:: audit-test
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

node.default['audit']['collector'] = "chef-visibility"
node.default['audit']["insecure"] = "true"

#/var/chef/cache/cookbooks is where this cookbook will live on a live node, we can point in there
#to find compliance tests shipped with this cookbook.
cookbook_profiles = {
  "name": "audit-test",
  "path": "/var/chef/cache/cookbooks/audit-test/files/tests/smoke/default"
}

#this checks to see if the profile path we want to add is already in the profiles list and adds it if it's not.
#note, this will error out if the cookbook audit is not somewhere in the run_list
node.default['audit']['profiles'].push(cookbook_profiles) unless node.default['audit']['profiles'].include?(cookbook_profiles)

