# dotfiles

This repository contains my configuration files and some simple automation for
setting everything up for the first time on computers running macOS. It lives in
a Dropbox folder which takes care of automatically syncing changes between my
computers. On occasion, updates are committed and pushed up to GitHub. None of
the automation is produciton-ready but it provides a good starting point.

## Installation

Clone the repository and run the init script from the root directory:

```bash
$ ./bin/init
```

This script installs [Homebrew](https://brew.sh/), configures a default shell,
links the dotfiles in this repository, and creates an empty `.bash_profile`
which is intentionally not tracked here as that file contains any configuration
specific to that computer such as environment variables or path changes. Files
are linked automatically from `./src` by Thoughtbot's
[rcm](https://github.com/thoughtbot/rcm) program.

## Adding New Files

Add the new configuration file `./src` without a leading period, then run:

```bash
$ ./bin/link
```

This invokes `rcup` to update and install any dotfiles managed by rcm.

## macOS Settings

If the macOS developer tools need to be installed or reinstalled, the following
command should work to install them without installing all of XCode:

```
$ sudo xcode-select --install
```

Sometimes a software update is needed first if the OS is outdated:

```
$ softwareupdate --all --install --force
```

Should the above two not work, this will delete and reinstall them:

```
$ sudo rm -rf /Library/Developer/CommandLineTools
$ sudo xcode-select --install
```

## Editor Settings

At this point, my editor settings across both VS Code and GoLand are synced
automatically and no longer need to be managed here. The VS Code configuration
files within are kept around as a reference and do not update automatically.

### GoLand

To install the `goland` command line program, download the
[Toolbox App](https://www.jetbrains.com/toolbox-app/).

### VS Code

When using the Vim extension on macOS, run this command to fix key repeat rates:

```
$ defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
```

This action to install the `code` command line program is helpful:

```
Shell Command: Install 'code' command in PATH
```
