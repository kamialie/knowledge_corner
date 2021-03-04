[server]
${server-ip} ansible_user=${user} ansible_ssh_private_key_file=${ssh-key}

[web_server]
${web-server-ip} ansible_user=${user} ansible_ssh_private_key_file=${ssh-key}
