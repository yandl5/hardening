#!/bin/bash
# Remediation is applicable only in certain platforms
if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ]; then

DEBIAN_FRONTEND=noninteractive apt-get install -y "systemd-timesyncd"

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi
