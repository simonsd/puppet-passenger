import 'classes/*'

class passenger (
	$webserver = 'httpd'
) {
    include passenger::packages
    include passenger::config

    Class['passenger::packages'] -> Class['passenger::config']
}
