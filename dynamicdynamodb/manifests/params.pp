class dynamicdynamodb::params {

  $aws_access_key_id        = 'UNSET'
  $aws_secret_access_key_id = 'UNSET'
  $aws_region               = 'eu-west-1'
  $aws_check_interval       = 300
  $circuit_breaker_enabled  = false
  $circuit_breaker_url      = 'UNSET'
  $circuit_breaker_timeout  = 500
  $log_config_file          = '/etc/dynamic-dynamodb/logging.conf'
  $tables                   = false
  $defaults                 = { enable_reads_autoscaling => 'false',
                                reads_upper_alarm_threshold => 0,
                                reads_lower_alarm_threshold => 0,
                                reads_upper_threshold  => 90,
                                reads_lower_threshold => 30,
                                increase_reads_with => 50,
                                decrease_reads_with => 50,
                                increase_reads_unit => 'percent',
                                decrease_reads_unit => 'percent',
                                min_provisioned_reads => 5,
                                max_provisioned_reads => 10,
                                num_read_checks_before_scale_down => 5, 
                                enable_writes_autoscaling => 'false',
                                writes_upper_alarm_threshold => 0,
                                writes_lower_alarm_threshold => 0,
                                writes_upper_threshold => 90,
                                writes_lower_threshold => 30,
                                increase_writes_with => 50,
                                decrease_writes_with => 50,
                                increase_writes_unit => 'percent',
                                decrease_writes_unit => 'percent',
                                min_provisioned_writes => 1,
                                max_provisioned_writes => 10,
                                allow_scaling_down_reads_on_0_percent => 'true',
                                allow_scaling_down_writes_on_0_percent => 'true',
                                always_decrease_rw_together => 'true',
                                maintenance_windows => 'UNSET',
                                sns_topic_arn => false,
                                sns_message_types => 'UNSET'
                              } 
  # Valid values for sns_message_types are "scale-up, scale-down, high-throughput-alarm, low-throughput-alarm"
  # as comma separated string.
}