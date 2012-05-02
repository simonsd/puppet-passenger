# == Class: passenger::packages
#
# Description of passenger::packages
#
# === Parameters:
#
# === Actions:
#
# === Requires:
#
# === Sample Usage:
#
class passenger::packages {
  package { 'rubygem-passenger':
    ensure   => $passenger::version,
    name     => 'passenger',
    provider => 'gem',
    require  => $::operatingsystem ? {
      default   => Package[$apache::params::service_name],
      archlinux => Package['apache'],
      debian    => Package['apache'],
    },
    before   => Service[$apache::params::service_name],
  }
  package { 'curl-devel':
    ensure  => installed,
    name    => $::operatingsystem ? {
      archlinux => 'curl',
      centos    => 'libcurl-devel',
      debian    => 'libcurl4-openssl-dev',
    },
  }

  package { 'gcc': }
  @package { 'gcc-c++': }

  if $::operatingsystem != 'archlinux' {
    realize(Package['gcc-c++'])
  }
}
