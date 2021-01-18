class testmagneto::php {
  package { "php7.4": }
  package { "php-cli":}
  package {"php-fpm":}
  package {"php-json":}
  package {"php-common":}
  package {"php-mysql":}
  package {"php-zip":}
  package {"php-gd":}
  package {"php-mbstring":}
  package {"php-curl":}
  package {"php-xml":}
  #package {"php-pear":}
  #pal php-bcmath
  service { "php7.4":
    ensure     => "running",
    hasrestart => true,
    hasstatus  => true,
    require    => [Package["php7.4","php-cli","php-fpm","php-json","php-common","php-mysql","php-zip","php-gd","php-mbstring","php-curl","php-xml"]]
  }
  #file { "/etc/php7.4/fpm/php.ini":
  #  content => template("testmagneto/php.ini.erb"),
  #  require => Package["php7.4"],
  #  notify  => Service["php7.4"]
  #}
}
