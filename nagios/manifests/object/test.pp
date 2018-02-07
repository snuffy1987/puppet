class test (
  String $host_name = 'TEST',
) {

 notify { "downcase(${host_name})": }
 notify { "${host_name}": }
 notify {"aaaa":}
}
include test
