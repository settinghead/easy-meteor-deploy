easy-meteor-deploy
=====================

__Ansible deployment scripts that help you quickly set up a production-ready meteor website on either a Ubuntu host or a Local Vagrant instance.__

__Work derived from [westonplatter](https://github.com/westonplatter/example_meteor_deploy)'s [example_meteor_deploy](https://github.com/westonplatter/example_meteor_deploy).__

### Dependencies
* VirtualBox
* Vagrant
* Ansible

### Usage
1. rename ```roles/deploy_app/vars/main.example.yml``` to ```roles/deploy_app/vars/main.yml```
2. In ```roles/deploy_app/vars/main.yml```, change ```app_name```, ```repo_url``` and ```domain_name``` to your own values.
2. Rename ```remote_inveontory.example``` to ```remote_inveontory```, and replace ```example.org``` in ```remote_inveontory``` with your own domain
3. Make sure your SSH key is properly set up to access your remote host
4. Run the following script to set up software required to run your Meteor app and deploy your app:
``` bash
sh ./deploy_remote.sh
```

### Example
TODO
<!-- TODO -->


### License
See License
