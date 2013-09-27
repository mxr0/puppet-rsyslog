#   Copyright 2013 Brainsware
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.

require 'spec_helper_system'

describe 'rsyslog class' do
    package_name = 'rsyslog'
    service_name = 'rsyslog'
    case node.facts['osfamily']
    when 'RedHat'
      logfile_name = 'messages'
    when 'Debian'
      logfile_name = 'syslog'
    end

  context 'default parameters' do
    # Using puppet_apply as a helper
    it 'should work with no errors' do
      pp = <<-EOS
      class { 'rsyslog': }
      EOS

      # Run it twice and test for idempotency
      puppet_apply(pp) do |r|
        r.exit_code.should_not == 1
        r.refresh
        r.exit_code.should be_zero
      end
    end

    describe package(package_name) do
      it { should be_installed }
    end
    describe service(service_name) do
      it { should be_enabled }
      it { should be_running }
    end

  end

  context 'with udp enabled' do
    # Using puppet_apply as a helper
    it 'should work with no errors' do
      pp = <<-EOS
      class { 'rsyslog':
        udp => true,
      }
      EOS

      # Run it twice and test for idempotency
      puppet_apply(pp) do |r|
        r.exit_code.should_not == 1
        r.refresh
        r.exit_code.should be_zero
      end
    end

    describe package(package_name) do
      it { should be_installed }
    end
    describe service(service_name) do
      it { should be_enabled }
      it { should be_running }
    end

    it 'should receive log messages on UDP port 514' do
      shell('logger -d -P 514 "It receives log messages on UDP port 514!" && grep -q "It receives log messages on UDP port 514!" /var/log/'+logfile_name) do |r|
        r.exit_code.should == 0
      end
    end

  end

  context 'with tcp on non-standard port enabled' do
    # Using puppet_apply as a helper
    it 'should work with no errors' do
      pp = <<-EOS
      class { 'rsyslog':
        tcp => '5140',
      }
      EOS

      # Run it twice and test for idempotency
      puppet_apply(pp) do |r|
        r.exit_code.should_not == 1
        r.refresh
        r.exit_code.should be_zero
      end
    end

    describe package(package_name) do
      it { should be_installed }
    end
    describe service(service_name) do
      it { should be_enabled }
      it { should be_running }
    end

    it 'should receive log messages on TCP port 5140' do
      shell('logger -P 5140 "It receives log messages on TCP port 5140!" && grep -q "It receives log messages on TCP port 5140!" /var/log/'+logfile_name) do |r|
        r.exit_code.should == 0
      end
    end

  end

end
