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

# == Class: rsyslog
#
# This class is the global entry for installing rsyslog
#
# === Parameters
#
# [*udp*]
#   Enable UDP listener. Can be true, false (default), or an Integer port.
#
# [*tcp*]
#   Enable TCP listener. Can be true, false (default), or an Integer port.
#
# [*relp*]
#   Enable RELP listener. Can be true, false (default), or an Integer port.
#
# === Examples
#
#  class { rsyslog: }
#
# === Authors
#
# Brainsware <puppet@brainsware.org>
#
# === Copyright
#
# Copyright 2013 Brainsware
#
class rsyslog (
  $udp  = $rsyslog::params::udp,
  $tcp  = $rsyslog::params::tcp,
  $relp = $rsyslog::params::relp,
) inherits rsyslog::params {

  anchor { 'begin': }
  class { 'rsyslog::install': } ->
  class { 'rsyslog::config': } ~>
  class { 'rsyslog::service': }
  anchor { 'end': }

}
