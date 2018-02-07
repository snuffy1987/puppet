class nagios::config inherits nagios {

file { '/etc/nagios/nagios.cfg':
        source  => 'puppet:///modules/nagios/nagios.cfg',
        ensure => present,
  }

file { '/etc/nagios/conf.d/pnp4commd.cfg':
ensure => 'file',
content => template('nagios/pnp4commd.cfg.erb'),
  }

file { '/etc/nagios/conf.d/pnp4nagios-definitions.cfg':
ensure => 'file',
content => 'define host {
   name       host-pnp
   action_url /pnp4nagios/index.php/graph?host=$HOSTNAME$&srv=_HOST_
   register   0
   }

define service {
   name       service-pnp
   action_url /pnp4nagios/index.php/graph?host=$HOSTNAME$&srv=$SERVICEDESC$
   register   0
   }',
  }


#generating service checks
create_resources(nagios::object::service, lookup(nagios::object::service))

}
