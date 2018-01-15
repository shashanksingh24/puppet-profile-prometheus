class profile_prometheus::packages {

  package { 'openjdk-7-jdk': ensure => 'installed' }
  package { 'maven2': ensure => 'installed' }
}
include profile_prometheus::packages
