# Packer lab

Install wordpress (with database) via VirtualBox

Run installation:
```shell
$ packer build server.json
```

### Requirements

+ ansible
+ ansible roles
```shell
$ ansible-galaxy role install -r requirements.yml
```
+ download debian image, run installation and install sudo
+ export virtual machine in `ova` format, name it `base.ova` and place in root
+ set username and password variables in shell environment
```shell
$ export BASE_USERNAME=student # this is example!
$ export BASE_PASSWORD=admin
```
+ packer builder needs valid checksum for validation, acquire via
```shell
$ shasum -a256 base.ova
```
