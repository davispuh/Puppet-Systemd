# == Class: systemd::hostname
#
# Set system's hostname
#
# === Parameters
#
# [*hostname*]
#   Hostname to be set.
#
# === Examples
#
#  class { systemd::hostname:
#    hostname => 'localhost'
#  }
#
class systemd::hostname (
  $hostname = $systemd::params::hostname,
  $hostname_command = $systemd::params::hostname_command,
  $command_path = $systemd::params::command_path,
  $command_timeout = $systemd::params::command_timeout
) inherits systemd::params {

  include systemd

  if $hostname {
    exec { "${hostname_command} ${hostname}":
    path        => $command_path,
    returns     => 0,
    timeout     => $command_timeout
    }
  }

}
