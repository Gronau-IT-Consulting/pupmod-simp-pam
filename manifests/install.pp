# Install the required PAM packages
#
class pam::install {
  assert_private()

  if $facts['os']['name'] in ['RedHat','CentOS'] {
    package { 'pam':         ensure => 'latest' }
    package { 'pam_pkcs11':  ensure => 'latest' }
    package { 'fprintd-pam': ensure => 'latest' }
  }
  elsif $facts['os']['name'] in ['Debian','Ubuntu'] {
    package { 'libpam-runtime':  ensure => 'latest' }
    package { 'libpam-pkcs11':   ensure => 'latest' }
    package { 'libpam-fprintd':  ensure => 'latest' }
    package { 'libpam-cracklib': ensure => 'latest' }
    package { 'libpam-faillock': ensure => 'latest' }
  }
  else {
    fail("OS '${facts['os']['name']}' not supported by '${module_name}'")
  }
}
