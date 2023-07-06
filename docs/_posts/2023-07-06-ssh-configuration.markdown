# SSH Configuration

## Client Side Settings - Part 1

1. Generate SSH key `ssh-keygen -t ed25519 -C "some comment"`.
   Save the private and public files with meaningful names in `~/.ssh` directory.

2. Configure connection settings in `~/.ssh/config` file.

```bash
# <Comment about profile: usage, reason, date etc.>
Host <profile name>
  HostName <Public IPv4 DNS / Public IPv4 address>
  PreferredAuthentications publickey
  IdentityFile <path to private key>
  IdentitiesOnly yes
  User <user of remote server>

# Test server - 06 July 2023
Host testserver
  HostName ec2-65-65-65-65.ap-south-1.compute.amazonaws.com
  PreferredAuthentications publickey
  IdentityFile ~/.ssh/id_ed25519_private
  IdentitiesOnly yes
  User ubuntu
```

## Server Side - Part 1

1. Append public key generated at Client Side - Step 1 to  `~/.ssh/authorized_keys`.

2. Edit `/etc/ssh/sshd_config` to edit configuration of SSH server. Run `sudo systemctl restart sshd` to apply configuration.

## Client Side - Part 2

1. Try connection `ssh testserver`
