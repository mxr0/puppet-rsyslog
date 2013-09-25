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
    default => 'installed'
  }

  package { $rsyslog::params::relp_package:
    ensure => $relp_ensure,
  }

}
