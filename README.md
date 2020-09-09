# arcus-slurm-on-openstack

## Create infrastructure

Typically you first create the infrastructure using terraform.
The terraform generates an ansible inventory for the next step.

## Ansible to configure infrastructure

The ansible creates a slurm cluster, and adds an NFS server on
the login node.
```
cd ansible
python3 -m venv .venv
. .venv/bin/activate
pip install -U pip
pip install "ansible<2.10"

ansible-galaxy install -r requirements.yml

ansible-playbook main.yml
```

## Building the OpenHPC image

The above slurm environment includes a custom slurm reboot script:
https://github.com/stackhpc/slurm-openstack-tools

It allows you to update a Slurm cluster using the following:
```
scontrol reboot [ASAP] reason="rebuild image:<image_id>" [<NODES>]
```

To create the image, we have an image-build playbook:

* First load your openstack credentials into your environment.
  This is necessary so that the script can upload the images to glance: 
```
source ~/openrc
```

* Run the playbook to build the image:
```
cd <GIT_CHECKOUT>/ansible/
ansible-galaxy install -r requirements.yml -p roles
ansible-playbook image-build.yml
```

You should now see the `arcus-openhpc` image registered in glance.
