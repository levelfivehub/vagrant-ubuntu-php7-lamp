# Quick vagrant installation of ZF2/Doctrine2 on Cent OS

### Work in progress ###

This repository is used to get a project setup with ZF2, all ready with the following:

- NodeJS
- Grunt (With some Doctrine commands pre-set)
- Bower (Bootstrap)
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
2. Complete work on ZF2 skeleton with Doctrine2/Node/Grunt/Bower to include into composer

###Please note; application will not display until you configure module and public directory###

Only currently supported on Linux/OS development environments.