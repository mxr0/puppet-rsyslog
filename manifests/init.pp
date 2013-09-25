# == Class: rsyslog
#
# This class is the global entry for installing rsyslog
#
# === Parameters
#
#
# === Variables
#
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
