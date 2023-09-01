# Exporters
## Vagrant
If you want to test this ansible in your local environment you can just download vagrant and after cloning the repository and going to the working directory where the Vagrantfile is, follow these steps to prepare the required test environment. Else you can just skip to the Deploy section.ans
Note that since there isn't any services installed on the test hosts the exporters won't work and some of the the containers would constantly in restarting state!
```
vagrant up [hostname]
```
You can use the following command to find the state of your vagrant host.
```
vagrant status
```
For connecting to hosts:
```
vagrant ssh [hostname]
```
For stopping the vms you can run the `vagrant halt [hostname]` and for destroying them you can run `vagrant destroy [hostname]`
## Deploy
In order to deploy your exporters, Follow these steps:

1. Install virtualenv via Pip:
```
pip install virtualenv
```
2. Create a new virtual environment:
```
virtualenv .env
```
3. Switch to the environment:
```
source .env/bin/activate
```
4. Install ansible and netaddr packages:
```
pip3 install -r requirements.txt
```
5. Update your inventory in **inventory/exporters** or create a new directory in inventory.
6. Update your group vars in **inventory/exporters/group_vars**
7. Check the correctness of your inventory groups and hosts:
```
ansible -i inventory/exporters/hosts.yml -m ping all

```
8. Deploy your Exporters:
```
ansible-playbook -b -i inventory/exporters/hosts.yml deploy.yml
```
9. After deploying the exporters, To verify that the containers are up run this command:
```
ansible -b -i inventory/exporters/hosts.yml -m shell -a "docker ps" all
```

## Destroy
In order to delete your exporters, Run this command:
```
ansible-playbook -b -i inventory/exporters/hosts.yml destroy.yml
```
## Notes
1. Instead of steps 1 to 4 you can run [install-env](https://github.com) script and switch to the environment.
```
source .env/bin/activate
```
