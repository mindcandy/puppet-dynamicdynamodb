Puppet module for Dynamic DynamoDB
==================================

Puppet module for use with Sebastian Dahlgren's [Dynamic DynamoDB](https://github.com/sebdah/dynamic-dynamodb) which allows for automated scaling of read/write capacity units in AWS DynamoDB tables based on CloudWatch metrics. 


PLATFORMS
---------
Supports Debian/Ubuntu only at present.

REQUIREMENTS
------------
You need to ensure the python-pip package is installed as the module will install Dynamic DynamoDB using the Puppet pip provider.

USAGE
-----

The module has been written so it encompasses all the known configuration options. It will put default options in place if not specified when call from Puppet. By default, autoscaling of tables is disabled so as to avoid accidentally doing things you might not want to happen until you've tested fully.

At it's most minimal, and assuming you are using Instance-Profile roles to get AWS credentials, calling the module will look something like this:

    class { 'dynamicdynamodb': 
        tables => [ {'mytable' => { enable_reads_autoscaling => 'true', 
                                    enable_writes_autoscaling => 'true' } 
                                  }
                  ]
    }

The "tables" variable in the module takes an array of hashes that contain a hash of the required config. The key for the hash is either the name of a specific table or alternatively a regex if you want to configure multiple tables at once (see the Dynamic DynamoDB docs [here](http://dynamic-dynamodb.readthedocs.org/en/latest/configuration_options.html#global-configuration) for more details).

If you choose to use individual hash arrays for each table then the module will iterate these when creating the configuration file from the erb template. The resulting config file will be put in "/etc/dynamicdynamodb/dynamic-dynamoddb.conf".

For more info about the config file and its options see [here](http://dynamic-dynamodb.readthedocs.org/en/latest/example_configuration.html)

DEFAULTS
--------

All the defaults for the module can be found in params.pp and are as follows. 

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

__NOTE__: sns_message_types is a coma separated string that can contain any or all of the following: "scale-up, scale-down, high-throughput-alarm, low-throughput-alarm"

