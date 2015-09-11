# Quick vagrant installation of ZF2/Doctrine2 on Cent OS

### Work in progress ###

This repository is used to get a project setup with ZF2, all ready with the following:

- NodeJS
- Grunt
- Bower
- Elastic Search
- Git
- xDebug
- MongoDB
- Even phpMyAdmin (yourdesiredhostname.com/phpMyAdmin)

Once downloading this repository, set up the configuration in:

```
infrastructure/init.cfg
```

Then run:

```
configure.sh
```

Resources: puphpet.com

Things to do:

1. Configure Doctrine to access local database automatically (no manual adjustments required)
2. Set up grunt tasks ready to be used on a new environment.  Such as Apache restart etc...

Only currently supported on Linux/OS development environments.