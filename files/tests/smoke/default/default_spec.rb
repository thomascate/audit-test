control "cpuinfo" do
  impact 1.0
  title "cpuinfo"
  desc "boilerplate cpuinfo check"
  describe file('/proc/cpuinfo') do
    it { should be_file }
  end
end

release_file = case os[:family]
when 'ubuntu'
  '/etc/lsb-release'
when 'centos'
  '/etc/centos-release'
else
  'UNKNOWN-PLATFORM-NO-RELEASE-FILE'
end

control "release info" do
  impact 1.0
  title "relinf"
  desc "boilerplate release info check"
  describe file(release_file) do
    it { should be_file }
  end
end

control "root_user" do
  impact 1.0
  title "root_user"
  desc "boilerplate root user check"
  describe user('root') do
    it { should exist }
    its('uid') { should eq 0 }
    its('groups') { should eq ['root'] }
  end
end

control "chef_installed" do
  impact 1.0
  title "chef_installed"
  desc "boilerplate chef installed check"
  describe package('chef') do
    it { should be_installed }
  end
end

control "chefdk" do
  impact 1.0
  title "chefdk"
  desc "boilerplate chefdk installed check"
  describe package('chefdk') do
    it { should_not be_installed }
  end
end

