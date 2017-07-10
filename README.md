# dotfiles

## Summary

These are all the configuration files I use when setting up new Apple computers.

I use [Homebrew](https://brew.sh/) as my package manager and Bash as my shell.

## Quick start

Run the init script:

```bash
$ ./bin/init
```

Add new dotfiles *without* a period prefix to `src/`. Files outside that directory are not linked.

After adding a new dotfile or editing an existing one re-run rcup to link them:

```bash
$ ./bin/link
```

## Further setup

Git is useful here to track changes but it does not sync automatically by default. I have this cloned into a Dropbox directory that is available on all my computers.
