class nagios::nrpe::install (
  String $package_ensure,
  Array[String] $package_name,
  Array[String] $service_name,
  String $service_ensure,
  Boolean $service_enable,
)

{
  package { $nagios::nrpe::install::package_name: ensure => $nagios::nrpe::install::package_ensure } ~>	
  service { $nagios::nrpe::install::service_name:
    ensure => $nagios::nrpe::install::service_ensure,
    enable => $nagios::nrpe::install::service_enable,
  }

contain nagios::nrpe::config

}

