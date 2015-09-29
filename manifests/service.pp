class kibana::service (
  $active = true,
) {
  service { "kibana" :
    ensure        => $active,
    enable        => $active,
    hasrestart    => true,
    hasstatus     => true,
  }
}
