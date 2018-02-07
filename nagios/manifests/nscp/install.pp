class nagios::nscp::install (
String $nscp_binary,
String $install_directory,
String $nscp_allowed,
String $nscp_config,
String $nscp_service,
String $nscp_service_ensure,
Boolean $nscp_service_enable,

){

file {"${install_directory}":  ensure => directory, } ->

file { "${install_directory}/${nscp_binary}":
  ensure => present,
  source => "puppet:///extra_files/nagios/${nscp_binary}",
  } ->


exec { "c:\\windows\\system32\\msiexec.exe /i \"c:\\temp_install\\NSCP-0.4.3.143-x64.msi\" /norestart ADDLOCAL=Plugins,MainProgram,FirewallConfig,DotNetPluginSupport,ProductFeature,CheckPlugins,NRPEPlugins,NSCPlugins,NSCAPlugin,ExtraClientPlugin,SampleScripts ALLOWED_HOSTS=127.0.0.1,${nscp_allowed} CONF_NSCLIENT=1 /passive":
  creates => "c:\\Program Files\\NSClient++\\${nscp_config}",
  } ->

file { "c:\\Program Files\\NSClient++\\${nscp_config}":
  ensure => present,
  source => "puppet:///extra_files/nagios/${nscp_config}",
  } ~> Service["${nscp_service}"]

service { "${nscp_service}":
  ensure => $nscp_service_ensure,
  enable => $nscp_service_enable,
  } 


}

