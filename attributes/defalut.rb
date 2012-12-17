default['chef-client']['config_dir']     = "/etc/chef"
default['chef-client']['log']['level']     = :info
default['chef-client']['log']['prog_name'] = "chef-client"
default['chef-client']['log']['facility']  = 8 # get const like  puts ::Syslog::LOG_USER

