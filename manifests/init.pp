# == Class: coreutils
#
# Full description of class coreutils here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class coreutils (
) {
  package { [
    'screen',
    'wget',
    'watch',
    'tmux',
    'socat',
    'coreutils',
    'findutils',
    'gnu-tar',
    'gnu-sed'
    'htop-osx',
    'netcat',
    'pwgen',
    'nmap',
    'the_silver_searcher',
    'cmake'
  ]:
    require => Homebrew::Tap['homebrew/dupes']
  }

  package { 'grep':
    install_options => [
      '--build-from-source',
      '--with-default-names'
    ],
    require         => Homebrew::Tap['homebrew/dupes']
  }

  file { '/usr/local/bin/stty':
    ensure => 'link',
    target => '/bin/stty'
  }
}
