# Org mode

## Calendar

| action                               | keybinding             |
|:-------------------------------------|:-----------------------|
| display                              | `C-c a w`              |
| capture todo                         | `C-c c i`              |
| refresh agenda                       | `g`                    |
| quit agenda                          | `q`                    |

## Todo

| action                               | keybinding             |
|:-------------------------------------|:-----------------------|
| sort todo                            | `M-x org-sort-entries` |
| change header hierarchy              | `M-S-right`            |
| new line with same header hierarchy  | `C-S-RET`              |
| new TODO with same header hierarchy  | `S-M-RET`              | 
| change `TODO` state                  | `S-<left/right arrow>` or `C-c C-t` |
| refile                               | `C-c C-w`              |
| estimate effort                      | `C-c C-x e`            | 
| display the global TODO list         | `C-c a t`              |

## Schedule

| action                               | keybinding             |
|:-------------------------------------|:-----------------------|
| add date schedule                    | `C-c C-s`              |
| add date deadline                    | `C-c C-d`              |
| add date indication                  | `C-c !`                |
| add a date                           | `C-c .`                |

### Timestamp

| action                                      | keybinding                 |
|:--------------------------------------------|:---------------------------|
| in one month                                | `<2005-10-01 Sat +1m>`     |
| in one month, warning me 3 days before      | `<2005-10-01 Sat +1m -3d>` |
| in one month, the same week day             | `<2005-10-01 Sat ++1m>`    |
| in one month from the moment it is DONE     | `<2005-10-01 Sat .+1m>`    |

# Org contact

## To add a contact :

```text
M-x org-capure
c
fill the form
```

The birthday (`yyyy-mm-dd`) of the contact is used in org-agenda.

## To look for contact

```text
M-x org-contact
type the name (or partial name) you are looking for
```

## Source

- [tip how to manage your contacts with orgcontacts](https://www.reddit.com/r/emacs/comments/8toivy/tip_how_to_manage_your_contacts_with_orgcontacts/)  
- [issue org-contact solved](https://github.com/rememberYou/.emacs.d/issues/4)  

# Org journal

| key binding | action                                                                              |
|-------------|-------------------------------------------------------------------------------------|
| `C-c C-j`   | insert a new entry into the current journal file (creates the file if not present). |
| `C-c C-f`   | go to the next journal file.                                                        |
| `C-c C-b`   | go to the previous journal file.                                                    |
| `C-c C-s`   | search the journal for a string.                                                    |

Highlight :

- search for string between two dates.
- `TODO` are moved to the next day if not `DONE`
- schedule a appointment in the future by adding a timestamp using `C-c .` (it will appear in `M-x org-agenda o`)

# Gurus
- [rememberYou](https://github.com/rememberYou/.emacs.d)
- [my life in org mode](https://karl-voit.at/orgmode/)

# Source
- [tip_how_i_organize_myself_with_orgmode](https://www.reddit.com/r/emacs/comments/9ajxqj/tip_how_i_organize_myself_with_orgmode/)
- [cabaret example](https://karl-voit.at/2016/12/18/org-depend/)
