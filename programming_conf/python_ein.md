# Emacs Ipython Notebook (EIN)

[EIN](https://github.com/millejoh/emacs-ipython-notebook) is strange.  
But use it this way and it will do what you expect it to do.  

1. in a shell, activate your `env` and launch `jupyter notebook --NotebookApp.token=''`
2. in Emacs, type `M-x ein:login`, select the correct port

There we go.  
Launching the notebook from emacs is just a matter of chance : it works 1/3 times and if it doesn't work straight you have to relaunch emacs.  
So... not worth trying. Just do as I said before, it will run the thing just fine. 

## Work with cell

| action              | kbd       |
|---------------------|:----------|
| insert cell above   | `C-c C-a` |
| insert cell below   | `C-c C-b` |
| split cell at point | `C-c C-s` |
| merge cell          | `C-c RET` |
| kill cell           | `C-c C-k` |

## Execute code 

| action                     | kbd       |
|----------------------------|:----------|
| execute cell               | `C-c C-c` |
| execute cell and goto next | `M-RET`   |


## Display image inline 

```text
M-x customize-group RET ein
Ein:Output Area Inlined Images
```

# Improvement

- [ ] open currently running notebook with token/password
- [ ] run ein directly in emacs without bug (right now works 1 out of 5 time)
- [ ] make emacs become aware of existing kernel (python environement)
