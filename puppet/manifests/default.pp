# Misc
exec { 'apt-get update':
  command   => '/usr/bin/apt-get update',
}

package { 'build-essential':
  ensure    => installed,
}

# Database
package { ['sqlite3', 'libsqlite3-dev']:
  ensure    => installed,
}

# Ruby and Rails
package { 'ruby1.9.3':
  ensure    => installed,
  require   => Exec['apt-get update'],
}

package { 'rails':
  ensure    => installed,
  provider  => 'gem',
  require   => Package['ruby1.9.3'],
}

# Kerberos stuff
package { 'libkrb5-dev':
  ensure    => installed,
}

package { 'timfel-krb5-auth':
  ensure    => installed,
  provider  => 'gem',
  require   => [Package['build-essential'],Package['libkrb5-dev']]
}

file { 'krb5.conf':
  ensure    => present,
  name      => '/etc/krb5.conf',
  source    => '/vagrant/puppet/files/krb5.conf',
  owner     => 'root',
  group     => 'root',
  mode      => 0644,
}

# git
package { 'git':
  ensure    => installed,
}
