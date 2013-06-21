# == Class: gstatsd
#
# This module will install gstatsd and configure it to send statistics to a
# Graphite instance (on localhost by default)
#
# It assumes that the python-dev python-pip are already installed by another 
# module such as https://github.com/stankevich/puppet-python
#
# === Parameters
#
# The following optional parameters are available:
#
# [*flush_interval*]
#   How often to flush metrics to the Graphite server. The module (and gstatsd)
#   default is 10s.
#
# [*graphite_server*]
#   The host on which Graphite (carbon-cache) is listening. The module default
#   is localhost.
#
# [*graphite_port*]
#   The port on which Graphite (carbon-cache) is listening. The default port for
#   carbon-cache is 2003.
#
# [*percent_threshold*]
#   When sending time information, calculate the Nth percentile. The default for
#   gstatsd is 90.
#
# === Examples
#
#  class { gstatsd:
#    flush_interval    => 10,
#    graphite_server   => 'localhost',
#    graphite_port     => 2003,
#    percent_threshold => 90,
#  }
#
# === Authors
#
# Sam J Sharpe
#
# === Copyright
#
# Copyright 2013, Sam J Sharpe
#

class gstatsd (
    flush_interval    = 10,
    graphite_server   = 'localhost',
    graphite_port     = 2003,
    percent_threshold = 90,
) {
    package {'libevent-dev':
        ensure => installed,
    }
    package {'gevent':
        ensure   => present,
        provider => 'pip',
        requires => Package['libevent-dev'],
    }
    package {'gstatsd':
        ensure   => present,
        provider => 'pip',
        requires => Package['gevent']
    }
    file {'/etc/default/gstatsd':
        ensure   => present,
        content  => template('gstatsd/defaults.erb'),
        requires => Package['gstatsd'],
    }
    file {'/etc/init/gstatsd.conf':
        ensure   => present,
        source   => 'puppet:///gstatsd/upstart.conf',
        requires => File['/etc/default/gstatsd'],
    }
    service {'gstatsd':
        ensure   => running,
        provider => 'upstart',
        requires => File['/etc/init/gstatsd.conf'],
    }
}
