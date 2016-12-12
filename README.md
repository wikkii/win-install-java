# win-install-java
puppet module to install a list of programs and java development environment on windows

To use this module simply copy the java-win-install module folder into your puppet modules folder and add it to your site.pp

NOTE: this module requires puppetlabs/windows module to be installed 

##packages

this module installs the following packages from chocolatey:
-gedit
-maven
-git
-vlc
-eclipse
-malwarebytes
-firefox
-flashplayerplugin
-tomcat
-mysql
-mysql.workbench
-putty.portable

##files

this module creates mozilla.cfg and autoconfig.js
to set the home page to duckduckgo.com and make firefox show open tabs and windows from last time upon startup.

##services

This module ensures that the following services are running on windows
-mysql
-Tomcat8

##registry

this module set the windows telemetry level to the lowest possible by creating registry key for it.
