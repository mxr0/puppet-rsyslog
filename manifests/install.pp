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

# == Class: rsyslog::install
#
# This class takes care of installing all packages we might need
#
# === Authors
#
# Brainsware <puppet@brainsware.org>
#
# === Copyright
#
# Copyright 2013 Brainsware
#
class rsyslog::install {

  include rsyslog
  include rsyslog::params

  package { $rsyslog::params::package:
    ensure => installed,
  }

  $relp_ensure = $::rsyslog::relp? {
    false   => 'absent',
    default => 'installed',
  }

  package { $rsyslog::params::relp_package:
    ensure => $relp_ensure,
  }

}
