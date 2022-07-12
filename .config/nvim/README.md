# Setting up NVIM on a new machine

Ensure python3.10 is installed, this also may require installing pip/ensurepip
for python3.10, something like `sudo apt install python3.10-venv` on
Debian/Ubuntu.

## Install nvim-specific virtualenv

```
python3.10 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```

This allows nvim to have its own version of python-lsp-server, etc., separate
from the virtualenv that is used for a specific python project. Note that without this,
you'll see an error when neovim starts up that it can't find the python interpreter
or pylsp, because of this line in `init.vim`:

```
let g:python3_host_prog=$HOME."/.config/nvim/venv/bin/python3"
```
