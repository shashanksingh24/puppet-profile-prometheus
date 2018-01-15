class profile_prometheus::node_exporter (
) {
# this install node exporter
archive { '/opt/node_exporter-0.15.2.linux-amd64.tar.gz' :
  ensure        => present,
  extract       => true,
  extract_path  => '/opt',
  source        => 'https://github.com/prometheus/node_exporter/releases/download/v0.15.2/node_exporter-0.15.2.linux-amd64.tar.gz',
  checksum      => '1ce667467e442d1f7fbfa7de29a8ffc3a7a0c84d24d7c695cc88b29e0752df37',
  checksum_type => 'sha256',
#  creates       => '/opt/node_exporter',
  cleanup       => true,
}

#-> exec { '/bin/cp /opt/node_exporter-0.15.2.linux-amd64 /opt/node_exporter': }

file { '/opt/node_exporter-0.15.2.linux-amd64.tar.gz':
  ensure => absent,
}

}
