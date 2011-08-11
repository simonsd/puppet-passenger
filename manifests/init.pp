import 'classes/*'

class passenger (
	$webserver = 'httpd',
	$stages = 'no',
	$version = '3.0.8'
) {
	if $stages == 'no' {
	    Class['apache::packages'] -> class{'passenger::packages':} -> class{'passenger::config':} -> Class['apache::service']
	} else {
		class {
			'passenger::packages':
				require => 'apache::packages',
				stage => depends;
			'passenger::config':
				require => 'passenger::packages',
				before => 'apache::service',
				stage => config;
		}
	}
}
