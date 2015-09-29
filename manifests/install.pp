class kibana::install {

  if $kibana::installed {
    # Download the archive
    wget::fetch { "download-kibana-${kibana::version}" :
      source_url        => "${kibana::params::download_url}",
      target_directory  => "${kibana::download_dir}",
      target_file       => "${kibana::params::download_file}",
      require           => File["${kibana::download_dir}"],
    } ->
    # Untar the archive
    exec { "untar-kibana-${kibana::version}" :
      command           => "/bin/tar xf ${kibana::download_dir}/${kibana::params::download_file} --directory ${kibana::install_dir}",
      unless            => "test -d ${kibana::install_dir}/${kibana::params::file}",
    }
  } else {
    file { "${kibana::download_dir}/${kibana::params::download_file}" :
      ensure            => absent,
    } ->
    file { "${kibana::install_dir}/${kibana::params::file}" :
      ensure            => absent,
    }
  }
  file { "${kibana::install_dir}/kibana" :
    ensure              => $kibana::installed ? {
      false   => absent,
      default => link },
    target            => "${kibana::install_dir}/${kibana::params::file}",
  }
  # Logs directory
  file { "/var/log/kibana" :
    ensure            => $kibana::installed ? {
      false   => absent,
      default => directory },
    owner             => "${kibana::user}",
    group             => "${kibana::group}",
  }
  # Init file
  file { "/etc/init.d/kibana" :
    ensure            => $kibana::installed ? {
      false   => absent,
      default => present },
    content           => template('kibana/kibana.init.erb'),
    mode              => 744,
  }

}
