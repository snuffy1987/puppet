class nagios::install inherits nagios {
    package { $nagios::package_name: ensure => $nagios::package_ensure }
}
