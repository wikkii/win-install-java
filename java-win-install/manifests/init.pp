class java-win-install {
	
	file { 'C:/Program Files/Mozilla Firefox/defaults/pref/autoconfig.js':
		ensure => 'file',
		content => template("java-win-install/autoconfig.js.erb"),
		require => Package['firefox'],
	} 
	
	file { 'C:/Program Files/Mozilla Firefox/mozilla.cfg': 
		ensure => 'file',
		content => template("java-win-install/mozilla.cfg.erb"),
		require => Package['firefox'],
	}
	
	Package {
		ensure => "installed",
		provider => "chocolatey",
	}

	package {["gedit", "maven",
		"git", "vlc", "eclipse",
		"malwarebytes", "firefox",
	 	"flashplayerplugin", "tomcat",
		"mysql", "mysql.workbench", "putty.portable"]:}	

	
	service {'mysql':
		ensure => 'running',
		enable => true,
		require => Package['mysql'],
	}

	service{'Tomcat8':
		ensure => 'running',
		enable => true,
		require => Package['tomcat']
	}
	
#	Works but the registry resource bellow does the same thing
#	dsc_registry{ 'telemetry':
#		dsc_ensure => 'Present',
#		dsc_key => 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\DataCollection',
#		dsc_valuename => 'AllowTelemetry',
#		dsc_valuedata => '0',
#		dsc_valuetype => 'Dword',
#	}

	registry_key{'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\DataCollection':
		ensure => present,	
	}

	registry_value{'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\DataCollection\AllowTelemetry':
		ensure => present,
		type => dword,
		data => 0,
	}


}
