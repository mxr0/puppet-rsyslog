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
    content => template ('rsyslog/rsyslog.conf.erb'),
    owner   => 'root',
    group   => 'root',
  }
}
