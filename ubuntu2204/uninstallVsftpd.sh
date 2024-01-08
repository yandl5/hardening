#!/bin/bash
# CAUTION: This remediation script will remove vsftpd
#	   from the system, and may remove any packages
#	   that depend on vsftpd. Execute this
#	   remediation AFTER testing on a non-production
#	   system!

DEBIAN_FRONTEND=noninteractive apt-get remove -y "vsftpd"
