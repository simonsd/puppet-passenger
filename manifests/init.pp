class passenger (
  $version = '3.0.8'
) {
  include ::ruby
  include ::passenger::packages
  include ::passenger::config

  Class['::ruby'] ->
  Class['::passenger::packages'] ->
  Class['::passenger::config']

  Exec{ path => '/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin', }
}
