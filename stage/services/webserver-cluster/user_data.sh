user_data = <<EOF
#!/bin/bash
echo "Hello World!" >> index.html
echo "${data.terraform_remote_state.db.ouputs.address}" >> index.html
echo "${data.terraform_remote_state.db.outputs.port}" >> index.html
nohup busybox httpd -f -p ${var_server_port} &
EOF