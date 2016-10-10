function _chproject_enter () {
  local project="$1"
  cd "$project"
  export CHPROJECT="$(pwd -P)"
  echo "entering $(basename $CHPROJECT)"
  # TODO: activate project from .projectrc (or .chprojectrc?)
}

function _chproject_exit () {
  echo "leaving $(basename $CHPROJECT)"
  unset CHPROJECT
}

function chproject () {
  # N.b. this test currently doesn't distinguish between unset and
  # empty, but it's the standard portable pattern AFAIK
  [[ "x$CHPROJECT" != "x" ]] && {
    _chproject_exit "$CHPROJECT"
  }

  local project="$1"
  _chproject_enter "$project"
}
