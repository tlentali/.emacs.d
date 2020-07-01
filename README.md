<p align="center"><img src="misc/emacs_icon.svg" width=150 height=150/></p>
<p align="center"><a href="https://www.gnu.org/software/emacs/"><b>GNU Emacs</b></a></p>
<p align="center">
	<a href="https://www.gnu.org/software/emacs/"><img src="https://img.shields.io/badge/GNU%20Emacs-27.0.50-b48ead.svg?style=flat-square"/></a>
	<a href="https://orgmode.org/"><img src="https://img.shields.io/badge/org--mode-9.2.3-489a9f.svg?style=flat-square"/></a>
</p>
<p align="center">This repository contains my GNU Emacs configuration.</p>

---

# 🚀 Get inspired

This repo, on top of being a documented configuration for my future self, aims to inspire you through some features delivered by emacs.  
I advise people not to use this configuration directly.  
Not because I don't like you to have my configuration. Some of my settings are host-specific and/or depend on path variables, Elisp files I did not add to the GitHub repository, or external tools.  

You should only adopt Elisp code you need and understand, to avoid [Emacs Bankruptcy](https://www.emacswiki.org/emacs/DotEmacsBankruptcy).  

Therefore: please feel free to look up certain tricks and functions and add it to your configuration. But don't use my repository as is and expect it to run on your host.  

[[Source](https://karl-voit.at/2017/06/03/emacs-org/)]

# 🔥 Features

## ✨ Apparence

- start full screen
- cursor in bar instead of block
- remove menu
- remove tool bar
- remove scroll bar
- no line number
- hide the startup message
- set a homepage [dashboard](https://github.com/emacs-dashboard/emacs-dashboard) displaying recent used files
- cursor line position
- [horizon](https://github.com/aodhneine/horizon-theme.el) theme

## 🎉 Behavior

- typed text replaces the selection if the selection is active
- always [replace tabs with spaces](https://www.youtube.com/watch?v=SsoOG6ZeyUI) and set tab width to 4 spaces for all buffers
- cursor scroll [smoothly](https://github.com/aspiers/smooth-scrolling) 
- mousewheel scroll one line at a time (less "jumpy" than defaults)
- past without indentation mess
- [window numbering](https://github.com/nschum/window-numbering.el) to navigate between buffers easily
- [zoom](https://github.com/gonewest818/dimmer.el) current window size
- visually highlight the selected buffer using [dimmer](https://github.com/gonewest818/dimmer.el)
- disable backups auto-saves
- change yes-or-no questions into y-or-n questions
- After you split a window, your focus remains in the previous one.
- swiper instead of the default search 
- ibuffer instead of the default switch-to-buffer 
- move around quickly 
- emacs treats camelCase strings as a single word by default, this changes said behaviour
- typing the first character in a set of 2, completes the second one after your cursor
- briefly highlighted your cursor when changing buffer 
- colors parentheses and other delimiters depending on their depth
- highlights matching parens when the cursor is just behind one of them
- Expand region selection 
- popup-kill-ring

| action | kbd |
|---|:---|
| [window numbering](https://github.com/nschum/window-numbering.el) to navigate between buffers easily | `M-x 1` |
| swiper instead of the default search  | `C-s` |
| ibuffer instead of the default switch-to-buffer  | `C-x b` |
| move around quickly | `M-s` |
| Expand region selection | `C-q` |
| popup-kill-ring | `M-y` |
    
## 📓 Org mode

- [org agenda](https://blog.aaronbieber.com/2016/09/24/an-agenda-for-life-with-org-mode.html)
- [org contact](https://www.reddit.com/r/emacs/comments/8toivy/tip_how_to_manage_your_contacts_with_orgcontacts/)
  
## 🐍 Python

- [elpy](https://github.com/jorgenschaefer/elpy)
- use [flycheck](https://github.com/flycheck/flycheck) instead of flymake
- [neotree](https://github.com/jaypei/emacs-neotree)
- emacs ipython notebook : [ein](https://github.com/millejoh/emacs-ipython-notebook) and how to [use it](/programming_conf/python_ein.md) 
- [yasnippet](https://github.com/joaotavora/yasnippet) with custom [snippets](/snippet/python-mode)

# Maggit

| action | kbd |
|---|:---|
| open magit | `C-x g` |
| to stack | `s` |
| to unstack | `u` |
| to commit | `cc` + message + `C-c C-c` |
| to push | `Pp` |

# 🙌 Life changing tricks

- use [magit](https://magit.vc/), just use it
- on your computer settings, change the <kbd>CapsLk</kbd> by <kbd>ctrl</kbd>, you're welcome.

# 🛈 Source

- [.emacs.d](https://github.com/daedreth/UncleDavesEmacs) by Dawid Eckert
- [.emacs.d](https://github.com/purcell/emacs.d) by Purcell 
- [.emacs.d](https://github.com/bbatsov/emacs.d) by Bozhidar Batsov 
- [.emacs.d](https://github.com/rememberYou/.emacs.d) by RememberYou 
- [.emacs.d](https://github.com/garaud/foggycowinn/tree/master/emacs) by Damien Garaud 
- [mastering emacs in one year](https://github.com/redguardtoo/mastering-emacs-in-one-year-guide/blob/master/guide-en.org)
- [learn elisp in 15 minutes](https://learnxinyminutes.com/docs/fr-fr/elisp-fr/)

# 📜 Licence

The code is unlicensed, take what you like.
