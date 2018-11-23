# NodeJS

Instructions for installing NodeJS.


## Install

### n

```sh
$ mkdir ~/.npm-packages
$ echo "prefix=~/.npm-packages" >> ~/.npmrc
$ sudo apt remove nodejs nodejs-doc
$ curl -L https://git.io/n-install | sudo N_PREFIX=/opt/n bash
```


### NodeJS

The following examples installs version `8.12`:

```
$ sudo /opt/n/bin/n 8.12
```
