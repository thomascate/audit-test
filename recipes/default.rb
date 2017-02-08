#
# Cookbook:: audit-test
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

node.default['audit']['collector'] = "chef-visibility"
node.default['audit']["insecure"] = "true"

#/var/chef/cache/cookbooks is where this cookbook will live on a live node, we can point in there
#to find compliance tests shipped with this cookbook.
node.default['audit']["profiles"] = [
  {
    "name": "audit-test",
    "path": "/var/chef/cache/cookbooks/audit-test/files/tests/smoke/default"
  }
]

