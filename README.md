easy-meteor-deploy
=====================

__Ansible deployment scripts that help you quickly set up a production-ready meteor website on either a Ubuntu host or a Local Vagrant instance.__

## WARNING: README File Outdated

I'm actively working on a new version of easy-deploy. The README file below no longer applies. Please check back soon.


### Dependencies
* VirtualBox
* Vagrant
* Ansible

### Assumptions
- You have a git repository for your Meteor app and the app is in the `/app` folder of your repository.

### Usage

1. Clone this repository: ```git clone http://github.com/settinghead/easy-meteor-deploy.git```
3. Copy ```/vars/main.example.yml``` as ```/vars/main.yml```
4. In ```/vars/main.yml```, change ```app_name```, ```repo_url``` and ```domain_name``` to your own values.
5. Copy ```remote_inveontory.example``` as ```remote_inveontory```, and replace ```example.org``` in ```remote_inveontory``` with your own domain
6. Make sure your SSH key is properly set up to access your remote host
7. Run the following script to set up software required to run your Meteor app and deploy your app:
``` bash
sh ./deploy_remote.sh
```

### Your Own Customized Deployment Repository

The best way to create your own deployment repo that derives from this repo is to use git subtree:

```bash
mkdir my-deploy; cd my-deploy
git init
git remote add easy-remote https://github.com/settinghead/easy-meteor-deploy.git
git fetch easy-remote
git checkout -b easy easy-remote/master
git checkout master
git read-tree -m -u easy
```

Make changes to your custom repository, and use ```git commit``` to commit your changes to your own repo.

To update to latest easy-meteor-deploy,

```
git checkout easy
git pull
git checkout master
git merge --squash -s subtree --no-commit easy
```

__Work derived from [westonplatter](https://github.com/westonplatter/example_meteor_deploy)'s [example_meteor_deploy](https://github.com/westonplatter/example_meteor_deploy).__
