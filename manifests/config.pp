class kibana::config {
  file_line { 'kibana_port' :
    path    => "${kibana::params::config_file}",
    match   => "^port:",
    line    => "port: ${kibana::port}",
    require => File["${kibana::install_dir}/kibana"],
    notify  => Service["kibana"],
  }
  file_line { 'kibana_host' :
    path    => "${kibana::params::config_file}",
    match   => "^host:",
    line    => "host: \"${kibana::host}\"",
    require => File["${kibana::install_dir}/kibana"],
    notify  => Service["kibana"],
  }
  file_line { 'kibana_es_url' :
    path    => "${kibana::params::config_file}",
    match   => "^elasticsearch_url:",
    line    => "elasticsearch_url: \"${kibana::es_url}\"",
    require => File["${kibana::install_dir}/kibana"],
    notify  => Service["kibana"],
  }
  file_line { 'kibana_log_file' :
    path    => "${kibana::params::config_file}",
    match   => "log_file:",
    line    => "log_file: /var/log/kibana/kibana.log",
    require => File["${kibana::install_dir}/kibana"],
    notify  => Service["kibana"],
  }
}
