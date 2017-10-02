# chproject

A bash(1) command to spawn a new shell in a project directory and set up
your environment automatically. Unlike [projectrc][] it doesn't wrap
cd(1); rather it introduces a new command (much like the difference
between rvm and rbenv).

[projectrc]: https://github.com/dukex/projectrc


## Usage

    $ chproject path/to/myproject
    entering myproject
    myproject$ chproject
    /home/me/path/to/myproject

When you enter a project, `chproject` will look for a .projectrc file in
that directory (or any directory above it). The new shell will
automatically source that file, if present, to configure per-project
settings.

Example uses:

* Set per-project environment variables
* Initialize a language environment like virtualenv
* Ensure development dependencies are up-to-date
* Start an SSH tunnel in the background

If no .projectrc is found, `chproject` simply spawns a new shell in the
given directory.


## Tips & Tricks

Got a .env? Source your .env from .chprojectrc!

Got a shared .chprojectrc but want to allow user customization?

    [[ -f "$(dirname $BASH_SOURCE)/.chprojectrc.local" ]] && \
        . "$(dirname $BASH_SOURCE)/.chprojectrc.local"

Did you wander far from your project's base directory and need to get back?

    $ cd "$CHPROJECT"

Want to pause one project session and pick up another? bash `suspend`
command is your friend! It even prevents you from accidentally
suspending your login shell (and thus logging yourself out or
unexpectedly closing your tab). To get your first project session back,
use `fg %<jobnum>` (or in the simple case with only one suspended
session, just `fg`).
