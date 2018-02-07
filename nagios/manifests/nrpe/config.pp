class nagios::nrpe::config (
String $nrpe_allowed ) {

file_line { 'nrpe.cfg logging':
  notify  => Service['nrpe'],
  path => '/etc/nagios/nrpe.cfg',
  line => 'log_file=/var/log/nrpe.log',
  match   => '#log_file=/var/run/nrpe.log',
}

file_line { 'nrpe.cfg allowed':
  notify  => Service['nrpe'],
  path => '/etc/nagios/nrpe.cfg',
  line => "allowed_hosts=$nrpe_allowed",
  match   => 'allowed_hosts=127.0.0.1,::1',
} 

}
