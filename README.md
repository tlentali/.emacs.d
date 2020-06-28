<p align="center"><img src="misc/emacs_icon.svg" width=150 height=150/></p>
<p align="center"><a href="https://www.gnu.org/software/emacs/"><b>GNU Emacs</b></a></p>
<p align="center">
	<a href="https://www.gnu.org/software/emacs/"><img src="https://img.shields.io/badge/GNU%20Emacs-27.0.50-b48ead.svg?style=flat-square"/></a>
	<a href="https://orgmode.org/"><img src="https://img.shields.io/badge/org--mode-9.2.3-489a9f.svg?style=flat-square"/></a>
</p>
<p align="center">This repository contains my GNU Emacs configuration.</p>

---

# Using my Emacs Configuration by [Karl Voit](https://karl-voit.at/)

In case you want to check out and use my configuration instead of yours: Don't.  

I don't advise people to use it directly.  
Not because I don't like you to have my configuration. It is not easy to accomplish because I left out some parts. Some of my settings are host-specific and/or depend on path variables, Elisp files I did not add to the GitHub repository, or external tools.  

You should only adopt Elisp code you need and understand to avoid [Emacs Bankruptcy](https://www.emacswiki.org/emacs/DotEmacsBankruptcy).  

Therefore: please feel free to look up certain tricks and functions and add it to your configuration. But don't use my repository as is and expect it to run on your host.   

[[Source](https://karl-voit.at/2017/06/03/emacs-org/)]

# 🔥 Features

## Apparence

- start full screen
- cursor in bar instead of block
- remove menu
- remove tool bar
- remove scroll bar
- no line number
- hide the startup message
- set a [dashboard](https://github.com/emacs-dashboard/emacs-dashboard) homepage displaying recent used files

## Behavior

- typed text replaces the selection if the selection is active
- always replace tabs with spaces
- set tab width to 4 for all buffers
- cursor scroll [smoothly](https://github.com/aspiers/smooth-scrolling) 
- mousewheel scroll one line at a time (less "jumpy" than defaults)
- past without indentation mess
- [window numbering](https://github.com/nschum/window-numbering.el) to navigate between buffers easily
-[zoom](https://github.com/gonewest818/dimmer.el) current window size
- visually highlight the selected buffer using [dimmer](https://github.com/gonewest818/dimmer.el)
    
## Org mode

- [org agenda](https://blog.aaronbieber.com/2016/09/24/an-agenda-for-life-with-org-mode.html)
- [org contact](https://www.reddit.com/r/emacs/comments/8toivy/tip_how_to_manage_your_contacts_with_orgcontacts/)


## Python

- [elpy](https://github.com/jorgenschaefer/elpy)
- use [flycheck](https://github.com/flycheck/flycheck) instead of flymake
- [neotree](https://github.com/jaypei/emacs-neotree)
- emacs ipython notebook : [ein](https://github.com/millejoh/emacs-ipython-notebook) and how to [use it](/programming_conf/python_ein.md) 
- [yasnippet](https://github.com/joaotavora/yasnippet) with custom [snippets](/snippet/python-mode)

# Source

- Purcell [config](https://github.com/purcell/emacs.d)
- Bozhidar Batsov [config](https://github.com/bbatsov/emacs.d)
- RememberYou [config](https://github.com/rememberYou/.emacs.d)
- D. Garaud [config](https://github.com/garaud/foggycowinn/tree/master/emacs)
- [mastering emacs in one year](https://github.com/redguardtoo/mastering-emacs-in-one-year-guide/blob/master/guide-en.org)
- [learn elisp in 15 minutes](https://learnxinyminutes.com/docs/fr-fr/elisp-fr/)

# 📜 Licence

The code is unlicensed, take what you like.
