easy-meteor-deploy
=====================

__Ansible deployment scripts that help you quickly set up a production-ready meteor website on either a Ubuntu host or a Local Vagrant instance.__

## WARNING: Under Heavy Development; May subject to change

I'm actively working on a new version of easy-deploy. The README file below no longer applies. Please check back soon.


### Dependencies
* VirtualBox
* Vagrant
* Ansible

### Rationale

You may want to use easy-meteor-deploy if

- You need isolation for your different components so that they may be ready for horizontal scalability in the future
- You need to host multiple Meteor apps in one server without them interfering with each other
- You need Nginx
- You need customized components, such as Redis, RabbitMQ, Memcached, etc.
- You want a practice environment (e.g. Vagrant) to test your deployment
- Basically, you want complete control over your remote machine environment in an organized and declarative fashion

### Assumptions
- You have a git repository for your Meteor app and the app is in root folder of your repository.
- Your remote server runs Ubuntu 14.04. (Other versions of Ubuntu might work but are untested.)

### Usage

1. Fork this repo into `https://github.com/__yourname__/easy-meteor-deploy.git`
2. Under your Meteor project repository, create a git subtree

```bash
git remote add easy https://github.com/__yourname__/easy-meteor-deploy.git
git subtree add --prefix=.deploy easy master --squash
```
You will find a new `.deploy` under your project.

3. Make directory `mkdir .deploy_vars`
4. Copy `.deploy/vars/main.example.yml` as `.deploy_vars/main.yml`
4. In `/vars/main.yml`, change `app_name`, `repo_url` and `domain_name` to your own values.
5. Copy `server-inventories/remote_inveontory.example` as `./deploy_vars/inventories/master`, and replace `example.org` in `remote_inveontory` with your own domain
5. Copy `vars/server-addresses/master.example.yml` as `./deploy_vars/server_addresses/master.yml`, and replace `server.public.address` and ``server.internal.port` with your values
6. Make sure your SSH key is properly set up to access your remote host
7. Run the following script to set up software required to run your Meteor app and deploy your app:
``` bash
cd .deploy
ENV=master ./deploy.sh
```

### Deploy to Vagrant, for practice

```bash
cd .deploy
vagrant up
ENV=vagrant ./deploy.sh
```

### To update to latest easy-meteor-deploy

```
git fetch easy
git merge --squash -s subtree --no-commit easy/master
```

### How to Make a Pull Request (contribute back)

1. Make a commit with `git commit` that changes your `.deploy` folder
2. Push back to your fork by running
```
git subtree push --prefix .deploy easy delpoy --squash
```
3. Make a pull request from your fork

### TODO List

- Oplog tailing (coming soon)
- Dockerize Meteor/node app (for better isolation)
- Build apps in a specified environment (Linux ==> Linux)

__Work derived from [westonplatter](https://github.com/westonplatter/example_meteor_deploy)'s [example_meteor_deploy](https://github.com/westonplatter/example_meteor_deploy).__
