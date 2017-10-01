# chproject

A shell command to cd(1) into a project directory and set up your
environment automatically. Unlike [projectrc][] it doesn't wrap cd(1);
rather it introduces a new command (much like the difference between rvm
and rbenv).

[projectrc]: https://github.com/dukex/projectrc


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
