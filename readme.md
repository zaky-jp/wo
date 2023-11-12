# wo.zsh
*wo* (を, pronouced as *oh*) is a collection of zsh functions, aimed at facilitating various initialisation, configuration and installation using zsh.
## Usage
```shell
git clone https://github.com/zaky-jp/wo "${XDG_DATA_HOME}/wo"
echo 'source ${XDG_DATA_HOME}/wo/wo.zsh' >> "${ZDOTDIR}/.zshrc"
```
Off you go! You can start using helper functions.

## Examples
### log ([source](./core/log.zfunc))
```shell
log.notice 'hoge' #=> print messages in green
log.warn 'error' #=> print messages in red, and to fd/2
log.info 'fuga' #=> print indented message
log.fatal 'stop' #=> print like warn but exit immediately
```

### path ([source](./core/path.zfunc))
```shell
abs_path="$(path.get_absolute 'dir/file')" #=> get output abs path
path.exist 'dir/file' || log.warn 'file not found' #=> check file exists
path.do_symlink 'dir1/link' #=> mkdir dir1, then create symlink with abs path
```

### require ([source](./core/require.zfunc)) 
```shell
require 'macos' #=> fail if not running on macos
require 'ubuntu' #=> in the same manner, but on ubuntu
require apt 'nvim' #=> fail if apt has no nvim package
require brew 'mas' #=> use brew instead
require cask '1password' #=> can do casks
require snap 'lxd' #=> or notorious snaps
```

## How is *wo.zsh* named?
を, `U+3092` unicode char, is the last phoneme in Japanese alphabetical order[^1]. This is meant to represent *z* element from the zsh.

[^1]: Traditional phonemic system does not include ん character, as it was first appeared in Meiji era as a result of modern standardisation, thus making を the last phoneme. More on [wikipedia](https://en.wikipedia.org/wiki/Goj%C5%ABon).