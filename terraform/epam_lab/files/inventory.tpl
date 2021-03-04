[server]
${server-ip} ansible_user=${user} ansible_ssh_private_key_file=${ssh-key} nginx_user=${nginx_user}

[database]
${database-ip} ansible_user=${user} ansible_ssh_private_key_file=${ssh-key}
