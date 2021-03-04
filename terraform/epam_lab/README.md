# Terraform lab

Install wordpress and database in two separate instances in AWS via terraform
(provision with ansible)

Run installation:
```shell
$ terraform init
$ terraform apply
$ ansible-playbook -i inventory playbook.yml
```

### Requirements

+ create and download ssh key (in my case it is named `epam_learning`)
+ ansible
+ ansible roles
```shell
$ ansible-galaxy role install -r requirements.yml
```
+ set AWS credentials 
```shell
$ export AWS_ACCESS_KEY_ID=blabla
$ export AWS_SECRET_ACCESS_KEY=blabla
```
+ set correct AMI in `variables.tf` (I used Ubuntu 18.04 in eu-central-1 region)
