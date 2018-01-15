class profile_prometheus::cloudwatch_exporter (
) {

  file { 'cloudwatch-exporter-service-conf':
    ensure  => file,
    path    => '/etc/init/cloudwatch-exporter.conf',
    source => 'puppet:///modules/profile_prometheus/cloudwatch-exporter.conf',
  } ->

  file { 'cloudwatch-metrics.yml':
    ensure  => file,
    path    => '/etc/cloudwatch-metrics.yml',
    source => 'puppet:///modules/profile_prometheus/cloudwatch-metrics.yml',
  } ->

  file { 'alerts.yml':
    ensure  => file,
    path    => '/opt/prometheus-2.0.0.linux-amd64/alerts.yml',
    source  => 'puppet:///modules/profile_prometheus/alerts.yml',
  } ->

  exec { 'download-cloudwatch-exporter':
    command => '/usr/bin/curl -o /usr/local/bin/cloudwatch-exporter.jar http://search.maven.org/remotecontent?filepath=io/prometheus/cloudwatch/cloudwatch_exporter/0.4/cloudwatch_exporter-0.4-jar-with-dependencies.jar',
    unless => '/usr/bin/test -f /usr/local/bin/cloudwatch-exporter.jar',
  } ->

  service { 'cloudwatch-exporter-service':
    name   => "cloudwatch-exporter",
    ensure => running,
  }
}
