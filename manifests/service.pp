# == Class: rsyslog::service
#
# This class takes care that the service is running.
# By defining the service here, we can also notify it on configuration changes!
#
# === Authors
#
# Brainsware <puppet@brainsware.org>
#
# === Copyright
#
# Copyright 2013 Brainsware
#
class rsyslog::service {

  include rsyslog::params

  service { 'rsyslog':
    ensure => running,
    name   => $::rsyslog::service,
    enable => true,
  }

}
