define nagios::object::service (
  String $ensure = 'present',
  String $hostname = $name ,
  Array[String] $services,
) {
  validate_re($ensure, [ '^present$', '^absent$' ], "${ensure} isn't supported. Valid values are 'present' and 'absent'.")
  if $hostname { validate_string($hostname) }
  validate_array($services)


$services.each |String $services| {
  concat::fragment { "${services}${hostname}":
  target => "/etc/nagios/conf.d/${hostname}_services.cfg",
  content => template('nagios/service.cfg.erb'),
    }
  }
  concat { "/etc/nagios/conf.d/${hostname}_services.cfg":
  ensure => present,
  }
}

