# crostini Arch Linux ARM

> Notes on creating an Arch Linux ARM container in crostini.

## Provisioning

Run through the commands in [provision.sh](provision.sh) (type them out).

You can then log in via `lxc console`. The default username/password is `alarm`/`alarm`:

```shell
lxc console alarm
```

Once at the shell, install an AUR helper, e.g. [aurutils](aurutils.sh), then move on to [guest-tools](guest-tools.sh).
