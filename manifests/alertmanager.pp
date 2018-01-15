class profile_prometheus::alertmanager(
) {

#file { '/opt/temp.txt' :
#}
#include archive
archive { '/opt/alertmanager-0.13.0.linux-amd64.tar.gz' :
  ensure        => present,
  extract       => true,
  extract_path  => '/opt',
  source        => 'https://github.com/prometheus/alertmanager/releases/download/v0.13.0/alertmanager-0.13.0.linux-amd64.tar.gz',
  cleanup       => true,
}

file { '/opt/alertmanager-0.13.0.linux-amd64.tar.gz':
  ensure => absent,
}
}

#include profile_prometheus::alertmanager
