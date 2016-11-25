# == Class: systemd::locale
#
# Set system's locale
#
# === Parameters
#
# [*locale*]
#   Locale to be set.
#
# [*keymap*]
#   Keymap to be set.
#
# [*x11keymap*]
#   X11 Keymap to be set.
#
# === Examples
#
#  class { systemd::locale:
#    locale => 'en_US.utf8',
#    keymap => 'us',
#  }
#
class systemd::locale (
  $locale = $systemd::params::locale,
  $locale_command = $systemd::params::locale_command,
  $keymap = $systemd::params::keymap,
  $keymap_command = $systemd::params::keymap_command,
  $x11keymap = $systemd::params::x11keymap,
  $x11keymap_command = $systemd::params::x11keymap_command,
  $command_path = $systemd::params::command_path,
  $command_timeout = $systemd::params::command_timeout
) inherits systemd::params {

  include systemd

  if $locale {
    exec { "${locale_command} LANG=${locale}":
    path    => $command_path,
    returns => 0,
    timeout => $command_timeout
    }
  }

  if $keymap {
    exec { "${keymap_command} ${keymap}":
    path    => $command_path,
    returns => 0,
    timeout => $command_timeout
    }
  }

  if $x11keymap {
    exec { "${x11keymap_command} ${x11keymap}":
    path    => $command_path,
    returns => 0,
    timeout => $command_timeout
    }
  }

}
