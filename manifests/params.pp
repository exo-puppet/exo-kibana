class kibana::params {

  $download_base_url  = "https://download.elastic.co/kibana/kibana"
  $file               = "kibana-${kibana::version}-linux-x64"
  $extension          = "tar.gz"

  $download_file      = "${file}.${extension}"
  $download_url       = "${download_base_url}/${download_file}"

  $config_file        = "${kibana::install_dir}/kibana/config/kibana.yml"
}
