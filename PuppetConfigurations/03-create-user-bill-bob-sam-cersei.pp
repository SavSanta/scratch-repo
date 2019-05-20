
class b_users {

user { "bob" :
  ensure => "present",
  uid => "1001" ,
  password => pw_hash('admin1234', 'md5', $facts['system_uptime']['seconds'])
}

user { "bill" :
  ensure => "present",
  uid => "1002" ,
  password => pw_hash('admin1234', 'md5', 'TEST-LAB-SALT-ONLY')
}


	}


class c_users {

user { "sam" :
  ensure => "present",
  uid => "1004" ,
  password => pw_hash('admin1234', 'md5', $facts['system_uptime']['seconds'])
}

user { "cersei" :
  ensure => "present",
  uid => "1005" ,
  password => pw_hash('admin1234', 'md5', 'TEST-LAB-SALT-ONLY')
}


	}
