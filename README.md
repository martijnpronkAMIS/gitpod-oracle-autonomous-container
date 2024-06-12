# gitpod-oracle-autonomous-container

GitPod demo repository with the Oracle Autonomous Database container image.

Inspired by Lucas Jellema's work at https://github.com/lucasjellema/gitpod-oracle-database.git

[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/martijnpronkAMIS/gitpod-oracle-autonomous-container)

See Oracle documentation at https://container-registry.oracle.com/ords/ocr/ba/database/adb-free

## usage

This GitPod will create an Oracle database 23ai autonomous database container. 
The default username and password is admin/Welkom01#123. 

A cloud wallet is automatically copied from the container and placed in adb.zip. 
SQLcl is installed as well. make use of the cloud wallet using:

    /workspace/sqlcl/bin/sql -cloudconfig adb.zip user/pass@myatp_tp

A database user is created, apptest/Welkom01x123. This user is SODA enabled so you can use this
user to test out the mongodb ORDS listener

You can connect using the installed MongoSH with the following url:

    mongodb://apptest:Welkom01x123@localhost:27017/apptest?authMechanism=PLAIN&authSource=$external&ssl=true&retryWrites=false&loadBalanced=true&tlsInsecure=true

make sure to quote this url on the commandline.


