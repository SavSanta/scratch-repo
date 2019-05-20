#!/usr/bin/env ruby
# Customer Facter to check if the selinuxenabled binary exists. This is the general location I know of it in sane systems
# This doesnt work yet.


if {
    file { '/usr/sbin/selinuxenabled':
        ensure => exists,
    } == 'true'

{ $package_selinuxenable_exist == 'true' }

else { puts "false information baby"}

}
