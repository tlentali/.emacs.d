# Emacs Ipython Notebook (EIN)

[EIN](https://github.com/millejoh/emacs-ipython-notebook) is shit.  
But use it this way and it will do what you expect it to do.  

1. in a shell, activate your `env` and launch `jupyter notebook --NotebookApp.token=''`
2. in emacs, type `M-x ein:login`, select the correct port

There we go.  
Lanching the notebook from emacs is just a matter of change, it works 1/3 times and if it doesn't work straight you have to relaunch emacs.  
So... not worth trying. Just do as I said before, it will run the thing just fine. 

Work with cell :

```text
C-c C-a              ein:worksheet-insert-cell-above-km
C-c C-b              ein:worksheet-insert-cell-below-km
C-c C-s              ein:worksheet-split-cell-at-point-km
C-c RET              ein:worksheet-merge-cell-km
C-c C-k              ein:worksheet-kill-cell-km
```

Execute code : 

```text
C-c C-c              ein:worksheet-execute-cell-km
M-RET                ein:worksheet-execute-cell-and-goto-next-km
```

Display image inline : 

```text
M-x customize-group RET ein
Ein:Output Area Inlined Images
```

# Improvement

- [ ] open currently running notebook with token/password
- [ ] run ein directly in emacs without bug (right now works 1 out of 5 time)
- [ ] make emacs become aware of existing kernel (python environement)