class dynamicdynamodb::service {
  service { 'dynamicdynamodb':
    enable => true,
    ensure => running, 
    hasstatus => false,
    require => File["/etc/init.d/dynamicdynamodb"],
    status  => "ps -ef | grep -v grep | grep `cat /tmp/dynamic-dynamodb.default.pid`"
  }
}