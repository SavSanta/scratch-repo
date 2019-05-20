# This one has no classes and thusly no includes because I will leave it in the $MANIFESTDIR directly as I want it to run on all machines regardless because I hate being stuck with iproute2


if $::osfamily == 'RedHat' {
	$packagename = 'net-tools'
} elsif $::osfamily == 'Debian' {
	$packagename = 'iproute2'
} else { exit }


package { $packagename :

    ensure => installed,
    

}
