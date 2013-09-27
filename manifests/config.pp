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

# == Class: rsyslog::config
#
# This class takes care of configuring the basics we can set through
# `class{ 'rsyslog: }` parameters.
#
# === Authors
#
# Brainsware <puppet@brainsware.org>
#
# === Copyright
#
# Copyright 2013 Brainsware
#
class rsyslog::config {

  include rsyslog
  include rsyslog::params

  $config = $::rsyslog::params::config

  $udp  = $::rsyslog::udp
  $tcp  = $::rsyslog::tcp
  $relp = $::rsyslog::relp

  $udp_port = $udp? {
    true    => $::rsyslog::params::udp_port,
    default => $udp,
  }
  $tcp_port = $tcp? {
    true    => $::rsyslog::params::tcp_port,
    default => $tcp,
  }
  $relp_port = $relp? {
    true    => $::rsyslog::params::relp_port,
    default => $relp,
  }

  file { $config:
    ensure  => present,
    content => template ($::rsyslog::params::conf_template),
    owner   => 'root',
    group   => 'root',
  }
}
