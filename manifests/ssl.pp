class passenger::ssl {

  $ssl_packages = ['mod_ssl', 'mod_authz_ldap' ]

  package { $ssl_packages:
    ensure  => present,
    require => Package['webserver'],
    notify  => Service[$webserver],
  }

  file { "/etc/${webserver}/conf.d/ssl.conf":
    content => template('passenger/ssl.conf.erb'),
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    notify  => Exec['reload-apache2'],
  }

  file { '/var/cache/mod_ssl':
    ensure  => directory,
    owner   => 'apache',
    group   => 'root',
    mode    => '0750',
    notify  => Service[$webserver],
  }

  file { '/var/cache/mod_ssl/scache':
    ensure  => directory,
    owner   => 'apache',
    group   => 'root',
    mode    => '0750',
    require => File['/var/cache/mod_ssl'],
    notify  => Service[$webserver],
  }
}
