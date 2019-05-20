# Add DNS Server 1.1.1.1 to the /etc/resolv.conf
# Do note that some use dynamic udpdating

# Tip 1 - Could not get this to work because I put the site.pp not in the "Manifests" directory. I discovered it using "puppet config print manifest" on the master.
# Tip 2 - This apparently checks a variety of hostname types in different cases and different FQDNs or shortnames (but failed when using the IP directly): 
	# Error: Could not retrieve catalog from remote server: Error 500 on SERVER: Server Error: Could not find node statement with name 'default' or 'debian98-1.vcloud.lab.tenablesecurity.com, debian98-1.vcloud.lab.tenablesecurity, debian98-1.vcloud.lab, debian98-1.vcloud, debian98-1, Debian98-1.vcloud.lab.tenablesecurity.com, Debian98-1.vcloud.lab.tenablesecurity, Debian98-1.vcloud.lab, Debian98-1.vcloud, Debian98-1' on node debian98-1.vcloud.lab.tenablesecurity.com
 
node "debian98-1.vcloud.lab.tenablesecurity.com" {

include add_cloud_dns
include script_utils
include c_users

# This doesnt work if the file doesnt exist
file_line { 'trash' :

        ensure => present,
        line => 'nameserver 1.1.1.1',
        path => '/tmp/burgerstrash',

        }




}
