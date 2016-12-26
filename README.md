# `go-cli-template` - an example Go CLI application

This is an example repository that can be cloned and adapted for a new application. It contains useful scripts and
automation that I have found useful while building simple CLI-based applications.

### Example usage:

```
$ ./go-cli-template -version
Version: 0.1 (commit 7001c64 @ 2016-12-26)

 _        _______  _______  _______ 
( \      (  ___  )(  ____ \(  ___  )
| (      | (   ) || (    \/| (   ) |
| |      | |   | || |      | |   | |
| |      | |   | || | ____ | |   | |
| |      | |   | || | \_  )| |   | |
| (____/\| (___) || (___) || (___) |
(_______/(_______)(_______)(_______)

Project: <project url here>
```

```
$ ./go-cli-template -help
A detailed description of the project that will be inserted above the help text 
when the usage information is printed out.

  -version
    	Print the version string
```

### Steps for setting up a new project from this template

1. Clone the repository

```
$ git clone https://github.com/AstromechZA/go-cli-template.git
```

2. Rename all references to `go-cli-template` and the project url

There is a provided script `rename_everything.py` that will run through the relevant files and rename the 
references to the project name and import path. You will still need to rename the directory structure yourself.

```
$ ./rename_everything.py github.com/myuser/myrepo
```

The script will also delete itself after being run.

3. Tweak the git repo

You can either delete the `.git` directory and re-run `git init` or you can
just change the push/pull remotes and continue from there.

### Using the `vendor` folder and Godeps

Usually you would just clone the dependency into your `vendor` directory 
and commit that to master. The alternative is to use Godeps to anchor the 
dependency versions and ignore the `vendor` directory.

### Building your project

```
$ go build -v github.com/AstromechZA/go-cli-template
github.com/AstromechZA/go-cli-template
```

### Official Builds

The provided `make_official.sh` script will build official builds for both Linux and OSX with an official version
number baked in. It also compresses a `tgz` archive containing the built binaries for upload to Github or
whatever release mechanism is being used.

```
$ ./make_official.sh
Building official darwin amd64 binary for version '0.1 (commit 7001c64 @ 2016-12-26)'
Output Folder build/darwin_amd64
github.com/AstromechZA/go-cli-template
Done
-rwxr-xr-x  1 benmeier  staff   1.8M Dec 26 10:41 build/darwin_amd64/go-cli-template
build/darwin_amd64/go-cli-template: Mach-O 64-bit executable x86_64

Building official linux amd64 binary for version '0.1 (commit 7001c64 @ 2016-12-26)'
Output Folder build/linux_amd64
github.com/AstromechZA/go-cli-template
Done
-rwxr-xr-x  1 benmeier  staff   1.9M Dec 26 10:41 build/linux_amd64/go-cli-template
build/linux_amd64/go-cli-template: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), statically linked, not stripped

-rw-r--r--  1 benmeier  staff   1.3M Dec 26 10:41 go-cli-template-0.1.tgz
go-cli-template-0.1.tgz: gzip compressed data, from Unix, last modified: Mon Dec 26 10:41:32 2016
```

