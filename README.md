# Remote Workstation

## Remote workstation in a box!

Uses `xrdp` to enable login from windows.

Requires a ssh tunnel to work - password login is restricted to localhost.

### Deployment:

0. Log onto the target box.

0. Create a new password 

        python -c "import crypt; print crypt.crypt('my new password', 'my new salt)"

0. Run `UBUNTU_PASSWORD=<new_password> ./go.sh`

0. Log out.

0. Create a ssh tunnel

        ssh -i <IdentityFile> -p <Port> ubuntu@<target> -o IdentitiesOnly=yes -L <PortToForward>:127.0.0.1:3389

-. Fire up your RDP client and connect to `localhost:<PortToForward>`. The username is `ubuntu` and the default password is `hello there`.

### Local setup:

1. Start the vagrant box:

        vagrant up

1. Get the vagrant details (take note of `Port` and `IdentityFile`):

        vagrant ssh-config

1. Decide a `PortToForward` (e.g. 12345)

1. Create the ssh tunnel

        ssh -i <IdentityFile> -p <Port> ubuntu@127.0.0.1 -o IdentitiesOnly=yes -L <PortToForward>:127.0.0.1:3389

1. Fire up your RDP client and connect to `localhost:<PortToForward>`. The username is `ubuntu` and the default password is `hello there`.