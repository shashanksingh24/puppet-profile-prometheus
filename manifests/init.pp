class profile_prometheus {
# this is classes
  class { 'profile_prometheus::packages': }
  class { 'profile_prometheus::alertmanager': }
->  class { 'profile_prometheus::cloudwatch_exporter': }
->  class { 'profile_prometheus::prometheus': }
->  class { 'profile_prometheus::node_exporter': }
->  class { 'profile_prometheus::config': }
}
include profile_prometheus
