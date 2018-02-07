define nagios::object::host (
  String $ensure = 'present',
  String $host_name,
  String $aliass,
  String $address,
) {
  validate_re($ensure, [ '^present$', '^absent$' ], "${ensure} isn't supported. Valid values are 'present' and 'absent'.")
  if $host_name { validate_string($host_name) }
  if $address { validate_string($address) }
  if $aliass { validate_string($aliass) }

file { "/etc/nagios/conf.d/${host_name}_host.cfg":
  ensure => $ensure,
  content => template('nagios/host.cfg.erb'),
  notify => Service['nagios'],
  }
 

}
