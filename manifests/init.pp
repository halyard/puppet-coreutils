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
    'htop',
    'netcat',
    'pwgen',
    'nmap'
  ]:
    require => Homebrew::Tap['homebrew/dupes']
  }

  package { 'grep':
    install_options => [
      '--build-from-source',
      '--with-default-names'
    ],
    require => Homebrew::Tap['homebrew/dupes']
  }
}
