#Quick vagrant installation of Cent OS

This repository is used to get a new project setup, all ready with the following:

- CentOS
- Apache2
- PHP
- MySQL
- NodeJS
- Elastic Search
- Git
- xDebug
- MongoDB

Checkout this repository within the project folder where you intend to develop.

```
git clone git@github.com:gaurav-php/vagrant-centos-php5-apache2-mysql-quickstart.git infrastructure
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

Resources: puphpet.com

Only currently supported on Linux/OS development environments.

Any enquiries please email; gaurav@level5websites.com.