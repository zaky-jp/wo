#!/usr/bin/env zsh
# ==============================
# init 
# ==============================
# expects:
#  - default environment variables if not set
# ==============================
export WO_HOME="${WO_HOME:-${XDG_DATA_HOME}/wo}"
export WO_APT_CACHE="${WO_APT_CACHE:-${XDG_CACHE_HOME}/wo/apt.json}"
export WO_BREW_CACHE="${WO_BREW_CACHE:-${XDG_CACHE_HOME}/wo/brew.json}"
export WO_SNAP_CACHE="${WO_SNAP_CACHE:-${XDG_CACHE_HOME}/wo/snap.json}"
export WO_BREW_USER="${WO_BREW_USER:-homebrew}"
export WO_LOG_INDENT="${WO_LOG_INDENT:-==> }"

# ==============================
# generate cache and source
# ==============================
# expects:
#  - compile .zfunc files when:
#    - cache file does not exist
#    - any .zfunc file is newer than cache file
# ==============================
# list up all .zfunc files
local -a zfunc
() {
  emulate -L zsh -o extendedglob 
  zfunc=("${WO_HOME}/core/"*.zfunc "${WO_HOME}/pkg/"*.zfunc)
}

for f in ${zfunc}; do
  if [[ ! -f $f || $f -nt $f.zwc ]]; then
    zcompile -R $f
  fi
  source $f
done