# Org mode

## guru
- [rememberYou](https://github.com/rememberYou/.emacs.d)
- [my life in org mode](https://karl-voit.at/orgmode/)

## source
- [tip_how_i_organize_myself_with_orgmode](https://www.reddit.com/r/emacs/comments/9ajxqj/tip_how_i_organize_myself_with_orgmode/)
- [cabaret example](https://karl-voit.at/2016/12/18/org-depend/)

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

# Todo list

## Add Todo item

`C-c C-t`

## Insert a new TODO entry below the current one

`S-M-RET`

## Change task state

`C-c C-t` or `S-arrow`

## Schedule task

`C-c C-s`

## Deadline task

`C-c C-d`

## Repeated tasks

In one month :

`<2005-10-01 Sat +1m>`

In one month, warning me 3 days before :

<2005-10-01 Sat +1m -3d>

In one month, the same week day :

<2005-10-01 Sat ++1m>

In one month from the moment I made it DONE :

<2005-10-01 Sat .+1m>

## Show the global TODO list

`C-c a t`

# Agenda

Custome :

`C-c a o`

Normal :

`C-c a a`
