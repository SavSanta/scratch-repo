
# Install samba client tools
# I just wanted to try out a case switch. We're mainly installing smbclient for knowsn OS, but if not we'll default to installing the samba package and hope for best.

class smbclient {

    case $operatingsystem {
      'Suse', 'SLES':			 { $packagename = 'samba-client' }
      'RedHat', 'CentOS', 'Fedora': 	 { $packagename = 'samba'  }
      /^(Debian|Ubuntu)$/:		 { $packagename = 'smbclient'  }
      default:            		 { $packagename = 'samba' }
    }


    package { $packagename :

	    ensure => installed,

}

}
