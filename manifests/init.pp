# == Class: systemd
#
# Ensures that systemd packages are installed.
#
# === Parameters
#
# Document parameters here.
#
# [*systemd_package*]
#   Name of systemd package. Usually will be automatically set based on OS.
#
# [*systemd_ensure*]
#   Specify systemd ensure mode. Defaults to present.
#
# [*kbd_package*]
#   Name of kdb package. Usually will be automatically set based on OS.
#
# [*kbd_ensure*]
#   Specify ensure mode. Defaults to present.
#
# === Examples
#
#  class { systemd: }
#
class systemd (
  $systemd_package = $systemd::params::systemd_package,
  $systemd_ensure = $systemd::params::systemd_ensure,
  $kbd_package = $systemd::params::kbd_package,
  $kbd_ensure = $systemd::params::kbd_ensure
) inherits systemd::params {

  package { $systemd_package: ensure => $systemd_ensure }
  package { $kbd_package:     ensure => $kbd_ensure }

}
