
# Add DNS Server 1.1.1.1 to the /etc/resolv.conf
# Do note that some use dynamic udpdating


# Stuff commented immediately below didnt work
#$resolv = "/etc/resolv.conf"
#
#file { $resolv :
#
#        ensure => present,
#        } ->
#if "test -f $resolv -eq 0" {
#  exec { 'echo "nameserver 1.1.1.1" >> $resolv':
#       }
#}



# Notice I passed the variable in the classes parenthesis
class add_cloud_dns ($resolv = '/etc/resolv.conf') {

file_line { 'outside-resolving':

        ensure => present,
        line => 'nameserver     1.1.1.1',
        path => $resolv,

        }
}
