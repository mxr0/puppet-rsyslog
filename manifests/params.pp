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
