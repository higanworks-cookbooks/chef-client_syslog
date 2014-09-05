# chef-client_syslog cookbook

Send chef-client log to syslog.

reference from: https://gist.github.com/3616423

# Requirements

chef-client cookbook
syslog-logger gem (will be installed)

# Usage

add run_list recipe[chef-client_syslog::default]

## Suggegsions

Use with [cookbook[monit_bin]](http://community.opscode.com/cookbooks/monit_bin)

Add monitoring setting for monit like below.

<pre><code>    "monit": {
      "process": {
        "targets": {
          "chef-client": {
            "type": "pid",
            "pidfile": "/var/run/chef-client.pid",
            "start_program": "/usr/bin/chef-client -d -i 1800 -s 300 -l warn -P /var/run/chef-client.pid",
            "stop_program": "/bin/bash -c '/bin/kill `cat /var/run/chef-client.pid`'",
            "policies": [
              "if 2 restarts within 3 cycles then timeout"
            ]
          }
        }
      }
    } </code></pre>

chef-client daemon is watched by monit and controled under monit.

- `monit start/stop chef-client`


# Attributes

- default['chef_client']['log']['syslog_facility'] = '::Syslog::LOG_DAEMON'

The syslog facility to log to

- default['chef_client']['log']['syslog_progname'] = 'chef-client'

The program name reported to syslog

# Recipes

- default

# Author

Author:: HiganWorks LLC (<sawanoboriyu@higanworks.com>)

