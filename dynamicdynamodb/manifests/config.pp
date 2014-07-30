class dynamicdynamodb::config inherits dynamicdynamodb {
  file {'/etc/dynamic-dynamodb':
    ensure => directory
  }

  file {'/etc/dynamic-dynamodb/logs':
    ensure => directory
  }

  file {'/etc/dynamic-dynamodb/dynamic-dynamodb.conf':
    ensure  => present,
    content => template("dynamicdynamodb/dynamic-dynamodb.conf.erb"),
    require => File['/etc/dynamic-dynamodb'],
    notify  => Service['dynamicdynamodb']
  }

  file {'/etc/dynamic-dynamodb/logging.conf':
    ensure  => present,
    source  => 'puppet:///modules/dynamicdynamodb/logging.conf',
    require => File['/etc/dynamic-dynamodb'],
    notify  => Service['dynamicdynamodb']
  }

  file {'/var/log/dynamic-dynamodb':
    ensure  => directory,
    mode    => 0644,
  }

  file {'/etc/init.d/dynamicdynamodb':
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => 0755,
    source  => 'puppet:///modules/dynamicdynamodb/dynamicdynamodb.init',
  }
}