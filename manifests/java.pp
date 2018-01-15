class profile_prometheus::java (
) {

include ::wget
# this install node exporter
wget::fetch { "download jar file ":
  source      => 'https://repo1.maven.org/maven2/io/prometheus/jmx/jmx_prometheus_javaagent/0.5/jmx_prometheus_javaagent-0.5.jar',
  destination => '/opt/jmx_prometheus_javaagent-0.5.jar',
  timeout     => 0,
  verbose     => true,
}
include profile_prometheus::java
}
