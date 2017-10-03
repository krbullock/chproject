# chproject

A bash(1) command to spawn a new shell in a project directory and set up
your environment automatically. Unlike [projectrc][] it doesn't wrap
cd(1); rather it introduces a new command (much like the difference
between rvm and rbenv).

[projectrc]: https://github.com/dukex/projectrc


## Installation

Copy bin/chproject to a directory in your `$PATH`, or add the bin/
directory in this repository to your `$PATH`.

This may be replaced with a better method when I cut a proper release.


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

Got a .env? Source your .env from .projectrc!

Got a shared .projectrc but want to allow user customization?

    [[ -f "$(dirname $BASH_SOURCE)/.projectrc.local" ]] && \
        . "$(dirname $BASH_SOURCE)/.projectrc.local"

Did you wander far from your project's base directory and need to get back?

    $ cd "$CHPROJECT"

Want to pause one project session and pick up another? bash `suspend`
command is your friend! It even prevents you from accidentally
suspending your login shell (and thus logging yourself out or
unexpectedly closing your tab). To get your first project session back,
use `fg %<jobnum>` (or in the simple case with only one suspended
session, just `fg`).


## License (MIT)

Copyright (c) 2017 Kevin R. Bullock. All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are
met:

1. Redistributions of source code must retain the above copyright
   notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright
   notice, this list of conditions and the following disclaimer in the
   documentation and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
