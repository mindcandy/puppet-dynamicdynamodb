class dynamicdynamodb::install inherits dynamicdynamodb {

  package {'dynamic-dynamodb': 
    ensure   => present,
    require  => Package['python-pip'],
    provider => 'pip'
  }
}
