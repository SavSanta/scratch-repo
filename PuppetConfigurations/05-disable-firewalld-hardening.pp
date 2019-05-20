

# Disable the FirewallD primarily for CentOS/Red Hat 7+ to make communication easier. 
# Could also alternatively add the service but nah not for our lab

service { 'firewalld' :
    ensure => 'false' ,
}


# Old Hardcore method of finding SELinux installation and changing it's enforcement. New method is below 
# Might as well go ahead and remove SELinux's nonsense too.
#exec { 'byebye selinux' :
#    command => 'setenforce 0' ,
#    onlyif => 'selinuxenabled'
#}


if 1 == 1 { 
notice(" I started that gangsta ish $facts['os']['selinux']")
}
