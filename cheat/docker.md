# Docker tips

Change user UID :

```Dockerfile
ARG UID=1000
RUN usermod -u ${UID} www-data
```

* PHP Fpm default user: `www-data`
* Nodejs default user: `node`
* CircleCI default user: `circleci`

Retrieve mounted volume user:
```sh
set -- `ls -nd .` && LOCAL_UID=$3 && LOCAL_GID=$4
```

And then add user and group if not exists:
```sh
if ! egrep -i "${LOCAL_GID}" /etc/group ; then
    groupadd -f -g ${LOCAL_GID} bob
fi

if ! id ${LOCAL_UID} >/dev/null 2>/dev/null ; then
    useradd -u ${LOCAL_UID} -g bob bob && \
    mkdir -p /home/bob && \
    chown -R bob:bob /home/bob
fi
```

And run command as the defined user (in some cases, using UID and GID without creating user and group before can works):
```sh
sudo -g \#${LOCAL_GID} -u \#${LOCAL_UID} -E ${COMMAND}
```

