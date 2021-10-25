| topic              | keybinding                                          | description                                                                        |
| ---:               | :---                                                | :---                                                                               |
| #org #todo         | `C-c C-t`                                           | todo in org                                                                        |
| #org #todo         | `C-c C-s`                                           | add schedule time                                                                  |
| #org #todo         | `S-arrow`                                           | to navigate in dates                                                               |
| #org #todo         | `C-c ^` + `o`                                       | sort TODO and DONE in order                                                        |
| #org #agenda       | `C-c a o`                                           | display custom agenda                                                              |
| #org               | `C-enter`                                           | after a org mode * line to replicate the same level of hierachy                    |
| #org #contact      | `M-x org-capure` + `c` + fill the form              | add a contact (the birthday (yyyy-mm-dd) of the contact is used in org-agenda)     |
| #org #contact      | `M-x org-contact` + type the name (or partial name) | look for contact                                                                   |
| #org #journal      | `C-c C-j`                                           | insert a new entry into the current journal file (creates the file if not present) |
| #org #journal      | `C-c C-f`                                           | go to the next journal file                                                        |
| #org #journal      | `C-c C-b`                                           | go to the previous journal file                                                    |
| #org #journal      | `C-c C-s`                                           | search the journal for a string                                                    |
| #screen            | `C-x w`                                             | distraction free whiteroom                                                         |
| #screen            | `C-x 3`                                             | new vertical buffer                                                                |
| #screen            | `C-x 2`                                             | new horizontal buffer                                                              |
| #screen            | `M-1` or `2` or `3` ...                             | to select buffer                                                                   |
| #write             | `C-z`                                               | undo                                                                               |
| #write             | `C-S-z`                                             | redo                                                                               |
| #write #undotree   | `C-x u`                                             | popup undo tree                                                                    |
| #write #undotree   | `d`                                                 | undo tree display changes                                                          |
| #write #undotree   | `q`                                                 | quit undo tree                                                                     |
| #write             | `C-x C-s`                                           | save                                                                               |
| #write             | `M-u`                                               | upper word                                                                         |
| #write             | `M-l`                                               | lower word                                                                         |
| #write             | `M-y`                                               | popup ring kill                                                                    |
| #macro             | `C-x (`                                             | start a macro                                                                      |
| #macro             | `C-x )`                                             | end a macro                                                                        |
| #macro             | `C-x e`                                             | run last macro                                                                     |
| #macro             |                                                     | see code in macro                                                                  |
| #macro             | `M-x name-last-kbd-macro`                           | name last macro                                                                    |
| #macro             | `M-x insert-kbd-macro`                              | call named macro                                                                   |
| #macro             | `M-x kmacro-insert-counter` or `C-x C-k TAB`        | incremental number (https://stackoverflow.com/a/1510038/8479387)                   |
| #practical         | `M-x whitespace-cleanup`                            | to cleanup invisible stuff #practical                                              |
| #practical         | `C-g`                                               | to quit anything                                                                   |
| #practical         | `C-q`                                               | extend region selection                                                            |
| #practical         | `M-s`                                               | move around quickly using letters (avy)                                            |
| #navigation        | `C-x`                                               | isearch                                                                            |
| #navigation        | `C-c x`                                             | isearch with steroid (swiper)                                                      |
| #navigation        | `C-x t t`                                           | treemacs with git awareness                                                        |
| #navigation        | `C-f`                                               | create a new file wile in C-x C-f, add C-f                                         |
| #navigation        | `C-x C-f`                                           | to open a file                                                                     |
| #navigation #dired | `C-x d`                                             | go in dired                                                                        |
| #navigation #dired | `q`                                                 | quit dired                                                                         |
| #navigation #dired | `R`                                                 | rename file/folder                                                                 |
| #navigation #dired | `+`                                                 | create new file/folder                                                             |
| #navigation #dired | `D`                                                 | delete file/folder                                                                 |
| #git               | `C-x g`                                             | open magit                                                                         |
| #git               | `s`                                                 | stack                                                                              |
| #git               | `u`                                                 | unstack                                                                            |
| #git               | `c` + `c` + `commit message` + `C-c C-c`            | commit                                                                             |
| #git               | `P` + `p`                                           | push                                                                               |
| #git               | `q`                                                 | quit magit                                                                         |
