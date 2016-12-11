# win-install-java
puppet module to install a list of programs and java development environment on windows


file { 'C:/Program Files/Mozilla Firefox/defaults/pref/autoconfig.js':
  ensure  => 'file',
  content => 
}

file { 'C:\Program Files (x86)/Mozilla Firefox/mozilla.cfg':
  ensure  => 'file',
  content => 
}
