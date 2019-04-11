package require ldap

proc authenticateLDAP {s base query password} {
    # get results
    set results [ldap::search $s $base $query {}]
	puts $results
    

    if {[catch {ldap::bind $s "cn=read-only-admin,dc=example,dc=com" $password}]} {
        catch {ldap::disconnect $s}
        return false
    }  else  {
        catch {ldap::disconnect $s}
        return true
    }
}

proc escapeLDAP {str} {
    return [string map [list \
        "=" "\\=" " " "\\ " \
        "," "\\," "+" "\\+" \
        "+" "\\*" "\"" "\\\"" \
        ] $str]
}

puts "Using 'cn=read-only-admin,dc=example,dc=com' as login:"
set login "cn=read-only-admin,dc=example,dc=com"

puts "Utilizing 'password' as password:"
set password "password"

set s [ldap::connect ldap.forumsys.com]

set base "dc=example,dc=com"
set query "(objectClass=*)"


puts "executing Search Attempt"
puts [authenticateLDAP $s $base $query $password]


#ldap::search $s $base $query {}
# Tested Example Alternatives
# ldap::search $s "ou=scientists,dc=example,dc=com" "(objectClass=*)" "uniqueMember"
# ldap::search $s "ou=scientists,dc=example,dc=com" "(objectClass=*)" "" -scope one
# ldap::search $s "dc=example,dc=com" "(objectClass=*)" {}
# ldap::search $s "dc=example,dc=com" "cn=*" {}


exit 0
