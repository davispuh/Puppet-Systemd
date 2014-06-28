# == Class: systemd
#
# Class for setting params.
#
# === Parameters
#
# [*default_systemd_package*]
#   Name of systemd package. Usually will be automatically set based on OS.
#
# [*systemd_ensure*]
#   Specify systemd ensure mode. Defaults to present.
#
# [*default_kbd_package*]
#   Name of kdb package. Usually will be automatically set based on OS.
#
# [*kbd_ensure*]
#   Specify ensure mode. Defaults to present.
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
# [*hostname*]
#   Hostname to be set.
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
class systemd::params (
  $default_systemd_package = undef,
  $systemd_ensure          = present,
  $default_kbd_package     = undef,
  $kbd_ensure              = present,

  $locale                  = 'en_US.utf8',
  $keymap                  = 'us',
  $x11keymap               = undef,
  $hostname                = 'localhost',
  $timezone                = 'UTC',
  $local_rtc               = 'false',
  $use_ntp                 = 'true',

  $command_path            = ['/usr/bin', '/usr/sbin'],
  $command_timeout         = 3,
  $locale_command          = 'localectl set-locale',
  $keymap_command          = 'localectl set-keymap',
  $x11keymap_command       = 'localectl set-x11-keymap',
  $hostname_command        = 'hostnamectl set-hostname',
  $timezone_command        = 'timedatectl set-timezone',
  $rtc_command             = 'timedatectl set-local-rtc',
  $ntp_command             = 'timedatectl set-ntp'

) {

    case $facts[osfamily] {
      'Archlinux': {
        if ($default_systemd_package == undef) { $systemd_package = 'systemd' }
        else { $systemd_package = $default_systemd_package }
        if ($default_kbd_package     == undef) { $kbd_package     = 'kbd' }
        else { $kbd_package = $default_kbd_package }
      }
      'Gentoo': {
        if ($default_systemd_package == undef) { $systemd_package = 'sys-apps/systemd' }
        else { $systemd_package = $default_systemd_package }
        if ($default_kbd_package     == undef) { $kbd_package     = 'sys-apps/kbd' }
        else { $kbd_package = $default_kbd_package }
      }
      default: {
        if ($default_systemd_package != undef) { $systemd_package = $default_systemd_package }
        if ($default_kbd_package     != undef) { $kbd_package     = $default_kbd_package }
        if ($systemd_package == undef or $kbd_package == undef) { fail("Uknown OS ${facts[osfamily]}") }
      }
    }

}
