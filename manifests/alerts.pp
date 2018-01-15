class prometheus::alerts (
) {

#file { '/opt/temp.txt' :
#}

  archive { '/opt/prometheus-2.0.0.linux-amd64.tar.gz' :
    ensure        => present,
    extract       => true,
    extract_path  => '/opt',
    source        => 'https://github.com/prometheus/prometheus/releases/download/v2.0.0/prometheus-2.0.0.linux-amd64.tar.gz',
    checksum      => 'e12917b25b32980daee0e9cf879d9ec197e2893924bd1574604eb0f550034d46',
    checksum_type => 'sha256',
    creates       => '/opt/prometheus',
    cleanup       => true,
  }

  exec { '/bin/mv /opt/prometheus-2.0.0.linux-amd64 /opt/prometheus': }
  file { '/opt/prometheus-2.0.0.linux-amd64.tar.gz':
    ensure => absent,
  }
}
#include profile_prometheus::prometheus
