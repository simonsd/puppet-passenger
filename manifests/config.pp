# == Class: passenger::config
#
# Description of passenger::config
#
# === Parameters:
#
# === Actions:
#
# === Requires:
#
# === Sample Usage:
#
class passenger::config {
  file {
    'passenger.conf':
      path      => $::operatingsystem ? {
        default   => '/etc/httpd/conf.d/passenger.conf',
        debian    => '/etc/apache2/conf.d/passenger.conf',
      },
      content   => template('passenger/passenger.conf.erb'),
      mode      => '0644',
      owner     => 'root',
      group     => 'root',
      notify    => Service [$apache::params::service_name],
  }

  exec {
    'install modules':
      command => $::operatingsystem ? {
        default => "${ruby::bin_dir}/passenger-install-apache2-module --auto",
        debian  => "${ruby::lib_dir}/gems/${ruby::version}/gems/passenger-${passenger::version}/bin/passenger-install-apache2-module --auto",
      },
      creates => "${ruby::lib_dir}/gems/${ruby::version}/gems/passenger-${passenger::version}/ext/apache2/mod_passenger.so";
  }
}
