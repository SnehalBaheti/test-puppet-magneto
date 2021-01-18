# == Class: wordpress
#
# Installs and configures NGINX and PHP-FPM
# for serving Wordpress blogs.
#
# === Examples
#
#  class { "wordpress":
#    cache    => true,        # Enable/disable static asset caching... default false
#    database => 'wordpress', # Database name... default wordpress
#    user     => 'wordpress', # Database user name... default wordpress
#    password => 'wordpress', # Database user password... default wordpress
#  }
#
# === Authors
#
# Darren Coxall <darren@darrencoxall.com>
#
class testmagneto(
  $cache    = false,
  $database = 'testmagneto',
  $user     = 'webonise',
  $password = 'webonise123',
) {
  Exec {
    path => "/usr/bin",
  }

  exec { "apt-get update": }

  class { "testmagneto::mysql":
    database => $database,
    user     => $user,
    password => $password,
    require  => Exec["apt-get update"]
  }

  class { "testmagneto::nginx":
    cache   => $cache,
    require => Exec["apt-get update"]
  }

  class { "testmagneto::php":
    require => Exec["apt-get update"]
  }
}

