# == Class: systemd::timezone
#
# Set system's timezone
#
# === Parameters
#
# [*timezone*]
#   Timezone to be set.
#
# [*local_rtc*]
#   Whether use local time for RTC.
#
# [*use_ntp*]
#   Whether to use NTP.
#
# === Examples
#
#  class { systemd::timezone:
#    timezone => 'UTC',
#    use_ntp => true
#  }
#
class systemd::timezone (
  $timezone = $systemd::params::timezone,
  $timezone_command = $systemd::params::timezone_command,
  $local_rtc = $systemd::params::local_rtc,
  $rtc_command = $systemd::params::rtc_command,
  $use_ntp = $systemd::params::use_ntp,
  $ntp_command = $systemd::params::ntp_command,
  $command_path = $systemd::params::command_path,
  $command_timeout = $systemd::params::command_timeout
) inherits systemd::params {

  include systemd

  if $timezone {
    exec { "${timezone_command} ${timezone}":
    path    => $command_path,
    returns => 0,
    timeout => $command_timeout
    }
  }

  if $local_rtc {
    exec { "${rtc_command} ${local_rtc}":
    path    => $command_path,
    returns => 0,
    timeout => $command_timeout
    }
  }

  if $use_ntp {
    exec { "${ntp_command} ${use_ntp}":
    path    => $command_path,
    returns => 0,
    timeout => $command_timeout
    }
  }

}
