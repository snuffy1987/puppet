class nagios (
String $package_ensure,
Array[String] $package_name,
Array[String] $service_name,
String $service_ensure,
Boolean $service_enable,
String $process_perf_path,
String $config_dir,
)

{
contain nagios::install
contain nagios::service
contain nagios::config

Class['::nagios::install']
-> Class['::nagios::config']
~> Class['::nagios::service']


}
