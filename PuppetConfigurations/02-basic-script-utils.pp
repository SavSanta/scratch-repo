class script_utils {

  # Set install of python
 package { "python":
	ensure => "present"
}

  # Set install of python3
 package { "python3":
	ensure => "present"
}

  # Set install of ipython3
 package { "ipython3":
	ensure => "present"
}


  # Set install of tcl
 package { "tclsh":
	ensure => "present"
}


#---------
  # Set install of tclreadline
 package { "tclreadline":
	ensure => "present"
}

  # Configure the above tclreadline for easy command history and tab-completion. Setup the "replace" variable so that it doesnt continuously overwrite it.

	file { '/etc/skel/.tclshrc':
        ensure  => file,
        mode    => '0664',
        content  => "# Enable emacs-like readline capabilities in the tcl interpreter\n\nif {\$tcl_interactive} { package require tclreadline ; ::tclreadline::Loop }			
",
	replace => no,
    }

    file { '/root/.tclshrc':
        ensure  => file,
        mode    => '0664',
        source  => 'file:/etc/skel/.tclshrc',
	replace => no,
    }

#---------



  # Set install of perl
 package { "perl":
	ensure => "present"
}



}
