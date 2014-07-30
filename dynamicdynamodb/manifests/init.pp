class dynamicdynamodb (
  $aws_access_key_id        = $dynamicdynamodb::params::aws_access_key_id,
  $aws_secret_access_key_id = $dynamicdynamodb::params::aws_secret_access_key_id,
  $aws_region               = $dynamicdynamodb::params::aws_region,
  $aws_check_interval       = $dynamicdynamodb::params::aws_check_interval,
  $circuit_breaker_enabled  = $dynamicdynamodb::params::circuit_breaker_enabled,
  $circuit_breaker_url      = $dynamicdynamodb::params::circuit_breaker_url,
  $circuit_breaker_timeout  = $dynamicdynamodb::params::circuit_breaker_timeout,
  $log_config_file          = $dynamicdynamodb::params::log_config_file,
  $tables                   = $dynamicdynamodb::params::tables
  ) inherits dynamicdynamodb::params {
  
  if ! ($::operatingsystem in [ 'Debian', 'Ubuntu']) {
    fail("${::operatingsystem} not supported")
  }

  if ! $tables {
    fail("tables variable was not set when calling dynamicdynamodb. Exiting.")
  }

  anchor { 'dynamicdynamodb::begin': } ->

  class { '::dynamicdynamodb::install': } ->
  class { '::dynamicdynamodb::config': } ~>
  class { '::dynamicdynamodb::service': } ->

  anchor { 'dynamicdynamodb::end': }
}