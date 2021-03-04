# Jenkins lab

Setup jenkins server, molecule environemnt and 2 jobs to test pull requests
and deploy solution. Using Jenkins, Docker, Terraform, Ansible, Molecule, AWS, Github.

Run installation:
```shell
$ cd terraform
$ terraform init
$ terraform apply
$ cd ../ansible
$ ansible-playbook -i inventory server.yml
```

Set up pipelines in Jenkins UI, add credentials for AWS and ssh-key for web-server.

### Requirements

+ create and download (actually save it in jenkins credentials) ssh key (in my
case it is named `epam_learning`)
+ terraform
+ ansible
+ ansible roles
```shell
$ cd ansible ; ansible-galaxy role install -r requirements.yml
```
+ set AWS credentials 
```shell
$ export AWS_ACCESS_KEY_ID=blabla
$ export AWS_SECRET_ACCESS_KEY=blabla
```
+ set correct AMI in `variables.tf` (I used Ubuntu 20.04 in eu-central-1 region)
