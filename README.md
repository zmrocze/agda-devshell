# agda scaffold

## agda dev shell

### Shell

Nix shell provides the `agda` compiler, wrapped with the arguments that link to standard library and ghc.
Also `agda-mode` for use with emacs.
Also `als` for use with vscode.

#### Use with Vscode

You should install the vscode "agda-mode" extension. The extension ships with prebuilt binaries for the language server `als`. These may or may not work for you. That's why this shell provides the `als` executable.

Go to extensions settings (go to settings, find agda-mode).
First of all ensure that "Connect to Agda Language Server" is checked.

Secondly, remember that when you run `agda` you actually run a script that calls `agda` with few arguments.
The arguments specify the path to std-lib and to ghc.
You can verify that by running `cat $(which agda)`. You will see sth like:

```bash
#! /nix/store/r9h133c9m8f6jnlsqzwf89zg9w0w78s8-bash-5.2-p15/bin/bash -e
exec "/nix/store/srbrhp6wvwxiryh8drhnvn5pqa5swr2q-Agda-2.6.4/bin/agda"  --with-compiler=/nix/store/z0aijijxwi7h6nw789
1nb9kix6y8mpvg-ghc-9.4.8-with-packages/bin/ghc --library-file=/nix/store/m78b89nqd0721bw8kmiki6fzldiq69dm-libraries -
-local-interfaces "$@" 
```

The `als` needs to be informed about these arguments to see std-lib in scope.
Copy the cmdline arguments to agda and paste them into "Command Line Options" in the extension settings.
For example I putted there: `--with-compiler=/nix/store/z0aijijxwi7h6nw7891nb9kix6y8mpvg-ghc-9.4.8-with-packages/bin/ghc --library-file=/nix/store/m78b89nqd0721bw8kmiki6fzldiq69dm-libraries --local-interfaces`.

Now open Vscode from within the nix shell (by typing `code`). Try to compile agda source with `ctrl+c ctrl+l` - should work.

If the extensions doesn't work, ensure the extension is using `als` from path, not the presupplied binaries.

#### Use with emacs

For use with emacs consult some other sources. (Though this is the officially supported way by agda devs, so recommended iff you're emacs user).

## project template

You can run `nix flake init -t github:zmrocze/agda-devshell#agda` to copy some agda template to your dir.
