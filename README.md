#Quick vagrant installation of Cent OS

This repository is used to get a new project setup, all ready with the following:

- CentOS
- Apache2
- NodeJS
- Grunt (With some Doctrine commands pre-set)
- Bower (Bootstrap)
- Elastic Search
- Git
- xDebug
- MongoDB

Once downloading this repository, set up the configuration in:

```
infrastructure/init.cfg
```

Then run:

```
configure.sh
```

This installation will also remove the .git directory afterwards.  You will then need to set the git remote url in the 'app' folder.

```
cd app
git remote add origin {url}
```

You may need to make adjustments to the command above to cater for your own requirements.

####All your project files should live in the 'app' directory.  This will be generated after the installation process.

Resources: puphpet.com

Only currently supported on Linux/OS development environments.