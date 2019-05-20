class stdtrouble {

  # Set install of nmap
 package { "nmap":
ensure => "present"
}

  # Set install of curl
 package { "curl":
ensure => "present"
}

  # Set install of wget
 package { "wget":
ensure => "present"
}

  # Set install of netcat
 package { "netcat":
ensure => "present"
}

  # Set install of telnet
 package { "telnet":
ensure => "present"
}

  # Set install of hping3
 package { "hping3":
ensure => "present"
}

  # Set install of htop
 package { "htop":
ensure => "present"
}

  # Set install of sudo
 package { "sudo":
ensure => "present"
}

  # Set install of locate
 package { "locate":
ensure => "present"
}

  # Set install of elinks
 package { "elinks":
ensure => "present"
}

  # Set install of nano
 package { "nano":
ensure => "present"
}

  # Set install of screen
 package { "screen":
ensure => "present"
}



}
