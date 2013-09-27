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

# == Class: rsyslog::params
#
# This class provides sensible default values
# it should be the main entry for extending this module to different platforms.
#
# === Authors
#
# Brainsware <puppet@brainsware.org>
#
# === Copyright
#
# Copyright 2013 Brainsware
#
class rsyslog::params {

  $package = 'rsyslog'
  $service = 'rsyslog'

  # plugin packages
  $relp_package  = 'rsyslog-relp'
  $mysql_package = 'rsyslog-mysql'
  $pgsql_package = 'rsyslog-pgsql'

  $config  = '/etc/rsyslog.conf'
  $confd   = '/etc/rsyslog.d'

  case $operatingsystem {
      'RedHat', 'CentOS': { $conf_template     = 'rsyslog/rsyslog.rhel.conf.erb'  } # apply the redhat class
      /^(Debian|Ubuntu)$/:{ $conf_template     = 'rsyslog/rsyslog.conf.erb'  } # apply the debian class
      default:            { $conf_template     = 'rsyslog/rsyslog.conf.erb' } # apply the generic class
  }
 
  # by default, rsyslog isn't listening on any ports
  # only on a Unix socket
  $tcp  = false
  $udp  = false
  $relp = false

  # default ports
  $tcp_port  =  514
  $udp_port  =  514
  $relp_port = 2514

}
