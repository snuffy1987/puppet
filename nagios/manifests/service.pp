class nagios::service inherits nagios {

if ! ($nagios::service_ensure in [ 'running', 'stopped' ]) {
   fail('service_ensure parameter must be running or stopped')
 }

if ! ($nagios::service_enable in [ true, false ]) {
   fail('service_enable parameter must be true or false')
 }

  service { $nagios::service_name: 
    ensure => $nagios::service_ensure,
    enable => $nagios::service_enable, 
  }
}
