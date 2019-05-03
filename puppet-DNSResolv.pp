# puppet version 5
# Add DNS Server 1.1.1.1 to the /etc/resolv.conf
# Do note that some of our DNS use dynamic udpdating

# Tip 1 - Could not get this to work because I put the site.pp not in the "Manifests" directory. I discovered it using "puppet config print manifest" on the master.
# Tip 2 - This apparently checks a variety of hostname types in different cases and different FQDNs or shortnames (but failed when using the IP directly):
        # Error: Could not retrieve catalog from remote server: Error 500 on SERVER: Server Error: Could not find node statement with name 'default' or 'debian98-1.vcloud.lab.tenablesecurity.com, debian$




node "debian98-1" {

include stdlib 
$resolv = '/etc/resolv.conf'

file_line { 'full' :

        ensure => present,
        line => 'nameserver     1.1.1.1',
        path => $resolv,

        }
