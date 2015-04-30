## Ansible Meteor

Simple way to add meteor instalation on your ansible tasks

### Requirements


  * Tested on ansible 1.4

### Variables


```yaml
  meteor_version: "1.1.0.2"  #default version
```

### Testing

Use [Vagrant](https://www.vagrantup.com) and fire `vagrant up` to test.

### Example Playbook

  * Install ansible-meteor using galaxy

```bash
  ansible-galaxy install carlos.acp.meteor
```

  * Add to your playbook

```yaml
  - name: install meteor
    hosts: servers
    vars:
      meteor_version: "1.1.0.2"
    roles:
      - carlos.acp.meteor
```

#### Thanks to
- [Paulo Hecht](https://github.com/thehecht)
- [Jonathan Freedman](https://github.com/otakup0pe) for [ANXS-nodejs](https://github.com/ANXS/nodejs)

### License

Licensed under the MIT License. See the LICENSE file for details.
