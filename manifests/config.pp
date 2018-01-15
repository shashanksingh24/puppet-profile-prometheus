class profile_prometheus::config (
) {

#file { [ '/etc' ] :
#  ensure => 'directory',
#}

file { "/opt/prometheus-2.0.0.linux-amd64/prometheus.yml":
  ensure  => file,
#  content => template("profile_prometheus/prometheus.yml"),
  source => 'puppet:///modules/profile_prometheus/prometheus.yml',
}

-> file { '/etc/init/prometheus.conf' :
  ensure => 'present',
  source => 'puppet:///modules/profile_prometheus/prometheus.conf',
  notify =>  Service['prometheus'],
}
service { "prometheus":
  ensure => 'running',
  enable => 'true',
}

-> file { '/etc/init/node_exporter.conf' :
  ensure => 'present',
  source => 'puppet:///modules/profile_prometheus/node_exporter.conf',
  notify => Service['node_exporter'],
}

service { "node_exporter":
  ensure => 'running',
  enable => 'true',
}

file { '/opt/alertmanager-0.13.0.linux-amd64/alertmanager.yml' :
  ensure => 'present',
  source => 'puppet:///modules/profile_prometheus/alertmanager.yml',
}

file { '/etc/init/alertmanager.conf' :
  ensure => 'present',
  source => 'puppet:///modules/profile_prometheus/alertmanager.conf',
  notify => Service['alertmanager'],
}

service { "alertmanager":
  ensure => 'running',
  enable => 'true',
}
}
