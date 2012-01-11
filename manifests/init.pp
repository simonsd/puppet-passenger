class passenger (
  $version = '3.0.8'
) {
  class { '::ruby': }
  class { 'passenger::packages':
    require => Class['::ruby'],
  }
  class { 'passenger::config':
    require => Class['passenger::packages'],
  }

  Exec{ path => '/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin', }
}
