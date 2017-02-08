# audit-test

This is a test cookbook to demo a method of shipping compliance tests in a cookbook and sharing them with test-kitchen. If you have multiple cookbooks using this method on one node you will need to append the profiles array instead of just overwriting it like we do in recipes/default.rb.

In this example we use files/tests/smoke/default as the location for tests, in practice you can put them anywhere under files/. Keep in mind that normally tests live in tests/, however this is not pulled down to the node when it converges so wouldn't be available for compliance checking.

This cookbook does also rely on the audit cookbook being in the run_list after this cookbook.
https://github.com/chef-cookbooks/audit
