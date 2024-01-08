#!/bin/bash
# Remediation is applicable only in certain platforms
if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ] && { ( ! ( dpkg-query --show --showformat='${db:Status-Status}\n' 'chrony' 2>/dev/null | grep -q installed ) && ! ( dpkg-query --show --showformat='${db:Status-Status}\n' 'ntp' 2>/dev/null | grep -q installed ) ); }; then

SYSTEMCTL_EXEC='/usr/bin/systemctl'
"$SYSTEMCTL_EXEC" unmask 'systemd-timesyncd.service'
"$SYSTEMCTL_EXEC" start 'systemd-timesyncd.service'
"$SYSTEMCTL_EXEC" enable 'systemd-timesyncd.service'

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi
