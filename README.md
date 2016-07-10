#Quick vagrant installation of Cent OS

This repository is used to get a new project setup, all ready with the following:

- Ubuntu
- Apache2
- PHP 7
- MySQL 5.6
- NodeJS

Checkout this repository within the project folder where you intend to develop.

```
git clone git@github.com:levelfivehub/vagrant-ubuntu-php7-lamp.git infrastructure
```

This will then create an infrastructure folder for your Vagrant/infrastructure.

Once downloading this repository, set up the configuration in:

```
infrastructure/init.cfg
```

Note; the repository value can be left empty if you do not have a repository to start with.

Then run:

```
configure.sh
```

####All your project files should live in the 'app' directory.  This will be generated after the installation process.

If all went well, your project structure should look like the following:

```
-/Project
--/infrastructure
--/app
```

Within the app directory add your git repository.

```
git remote add origin {url-to-git}
git branch --set-upstream-to=origin/master  master
```

Database credentials:
```
Username: dbuser
Password: password
```

Resources: puphpet.com

Only currently supported on Linux/OS development environments.

Any enquiries please email; gaurav@level5websites.com.