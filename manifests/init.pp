class passenger (
  $version          = '3.0.8',
  $max_pool_size    = '6',
  $min_instances    = '0',
  $pool_idle_time   = '300',
  $prestart         = [],
  $high_performance = 'off',
) {
  include ::ruby
  include ::passenger::packages
  include ::passenger::config

  Class['::ruby'] ->
  Class['::passenger::packages'] ->
  Class['::passenger::config']

  Exec{ path => '/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin', }
}
