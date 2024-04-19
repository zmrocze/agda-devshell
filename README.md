
# agda template

Getting this to work is terrible

## How to

### Shell

Nix shell provides only agda compiler, wrapped with the arguments that link to standard library and ghc

### als

Language server is installed systemwide by other means (stack) and available as exec with the envrc's Path_add.

#### std-lib in als

for als to see std-lib as agda does, its supplied with arguments taken from the agda wrapper, in vscode extension settings.

#### vscode

Disable ctrl+x when in agda file. Install agda-mode extension. Install als (the extension provides prebuilt binaries which might accidentaly work for you).

#### emacs

als shenagans not needed. The nix shell provides agda-mode, which is all emacs needs (?). So the nix shell + emacs + (?) agda extension is everything.

