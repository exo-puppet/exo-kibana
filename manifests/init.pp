class kibana (
  $install_dir  = '/opt',
  $version      = '4.1.2',
  $installed    = true,
  $download_dir = '/srv/download',
  $user         = 'kibana',
  $group        = 'kibana',
  $host         = '127.0.0.1',
  $port         = 5601,
  $es_url       = "http://localhost:9200"
) {
  include kibana::params, kibana::install, kibana::service, kibana::config
}
