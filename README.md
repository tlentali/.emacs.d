<p align="center"><img src="./misc/emacs_icon.svg" width=150 heigth=150/></p>
<p align="center">
	<a href="https://www.gnu.org/software/emacs/"><img src="https://img.shields.io/badge/GNU%20Emacs-27.0.50-b48ead.svg?style=flat-square"/></a>
	<a href="https://orgmode.org/"><img src="https://img.shields.io/badge/org--mode-9.2.3-489a9f.svg?style=flat-square"/></a>
</p>
<p align="center">Personal <a href="https://www.gnu.org/software/emacs/"><b>GNU Emacs</b></a> configuration ✨🐂💫</p>

---

<!-- markdown-toc start - Don't edit this section. Run M-x markdown-toc-refresh-toc -->
**Table of Contents**

- [🚀 Get inspired](#get-inspired)
- [🧠 Why **Emacs** ?](#why-emacs)
- [🔥 Features](#features)
    - [⚡ Global editor behavior](#global-editor-behavior)
    - [✨ Appearance](#appearance)
    - [📑 Org mode](#org-mode)
    - [🐍 Python](#python)
    - [💽 Git](#git)
- [🙌 Life changing tricks](#life-changing-tricks)
- [🛈 Source](#source)
- [📜 License](#license)

<!-- markdown-toc end -->



# 🚀 Get inspired <a name="get-inspired"/>

This Emacs configuration, on top of being a documented configuration for my future self, aims to inspire you through some amazing features delivered by **Emacs**.  
This `.emacs.d` is made possible thanks to a lot of wise people (see a few in the [Source](#source) section).  
Please feel free to look up certain tricks and functions and add it to your configuration.  

A rule that I apply to avoid [Emacs bankruptcy](https://www.emacswiki.org/emacs/DotEmacsBankruptcy) : only adopt **Emacs Lisp** code you need and understand.  

# 🧠 Why **Emacs** ? <a name="why-Emacs"/>

>If you have to ask what jazz is,  
>you’ll never know.  
>**Louis Armstrong**

Some highlight in favor of **Emacs** :

- free as in "free speech" AND free as in "free beer"
- it is extensible, a lot
- a community of amazing and active people (so it's constantly evolving)
- programmatically interacting with text using [Emacs Lisp](https://learnxinyminutes.com/docs/fr-fr/elisp-fr/) and [macros](https://www.youtube.com/watch?v=ih8FpiK0zck)
- eventually works directly in the terminal
- full keyboard experience (but you can use your mouse if you want) 

# 🔥 Features <a name="features"/>

>Emacs is what you want it be. Emacs is power.  
>But with great power, comes great responsibility :  
>the responsibility to [think](https://www.youtube.com/watch?v=HqYnevHibaI).  
>**Bozhidar Batsov**

## ⚡ Global editor behavior <a name="global-editor-behavior"/>

>Editing is a rewording activity.  
>**Alan Perlis**

| state | activation                  | action                                                                                                                                   |
|:-----:|:----------------------------|:-----------------------------------------------------------------------------------------------------------------------------------------|
| ✅    | auto                        | typed text replaces the selection if the selection is active                                                                             |
| ✅    | auto                        | always [replace tabs with spaces](https://www.youtube.com/watch?v=SsoOG6ZeyUI) and set tab width to 4 spaces for all buffers             |
| ✅    | auto                        | cursor scroll [smoothly](https://github.com/aspiers/smooth-scrolling)                                                                    |
| ✅    | auto                        | mousewheel scroll one line at a time (less "jumpy" than defaults)                                                                        |
| ✅    | auto                        | past things without indentation mess                                                                                                     |
| ✅    | `M-x` `1` or `2` or `3` ... | [window numbering](https://github.com/nschum/window-numbering.el) to navigate between buffers easily                                     |
| ✅    | auto                        | [zoom](https://github.com/gonewest818/dimmer.el) current window size                                                                     |
| ✅    | auto                        | visually highlight the selected buffer using [dimmer](https://github.com/gonewest818/dimmer.el)                                          |
| ✅    | auto                        | disable backups auto-saves                                                                                                               |
| ✅    | auto                        | change yes-or-no questions into y-or-n questions                                                                                         |
| ✅    | auto                        | After you split a window, your cursor goes on the new one                                                                                |
| ✅    | `C-c s`                     | [swiper](https://github.com/abo-abo/swiper) instead of the default search                                                                |
| ✅    | `C-x b`                     | ibuffer instead of the default switch-to-buffer                                                                                          |
| ✅    | `M-s`                       | move around quickly with [avy](https://github.com/abo-abo/avy)                                                                           |
| ✅    | auto                        | treats camelCase strings as several words                                                                                                |
| ✅    | auto                        | typing "()", "[]", "{}" by pair                                                                                                          |
| ✅    | auto                        | briefly highlighted your cursor when changing buffer with [beacon](https://github.com/Malabarba/beacon)                                  |
| ✅    | auto                        | colors parentheses and other delimiters depending on their depth with [rainbow-delimiters](https://github.com/Fanael/rainbow-delimiters) |
| ✅    | auto                        | highlights matching parens when the cursor is just behind one of them                                                                    |
| ✅    | `C-x t t`                   | pop a tree layout file explorer [treemacs](https://github.com/Alexander-Miller/treemacs)                                                 |
| ✅    | `C-q`                       | [Expand region](https://github.com/magnars/expand-region.el) selection                                                                   |
| ✅    | `M-y`                       | [popup kill ring](https://github.com/waymondo/popup-kill-ring)                                                                           |
| ✅    | `C-x f`                     | use ido and [ido vertical mode](https://github.com/creichert/ido-vertical-mode.el) to find file instead of default file navigation       |
| ✅    | `C-x u`                     | [undo tree](http://pragmaticemacs.com/emacs/advanced-undoredo-with-undo-tree/)                                                           |


## ✨ Appearance <a name="appearance"/>

>Perfection is achieved, not when there is nothing more to add,  
>but when there is nothing left to take away.  
>**Antoine de Saint-Exupery**

A minimalist look :

| state | activation | action                                                                                                                                                                            |
|:-----:|:-----------|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ✅    | auto       | start full screen                                                                                                                                                                 |
| ✅    | auto       | bar cursor instead of block cursor                                                                                                                                                |
| ✅    | auto       | remove menu                                                                                                                                                                       |
| ✅    | auto       | remove tool bar                                                                                                                                                                   |
| ✅    | auto       | remove scroll bar                                                                                                                                                                 |
| ✅    | auto       | no line number                                                                                                                                                                    |
| ✅    | auto       | hide the startup message                                                                                                                                                          |
| ✅    | auto       | set a homepage [dashboard](https://github.com/emacs-dashboard/emacs-dashboard) displaying recent used files                                                                       |
| ✅    | auto       | cursor line position                                                                                                                                                              |
| ✅    | auto       | [horizon](https://github.com/aodhneine/horizon-theme.el) theme (and [sexy-monochrome](https://github.com/voloyev/sexy-monochrome-theme) via `M-x load-theme RET sexy-monochrome`) |
| ✅    | `C-x w`    | distraction-free writing mode with [writeroom](https://github.com/joostkremers/writeroom-mode)                                                                                    |
| ✅    | auto       | [Hack](https://github.com/source-foundry/Hack) font                                                                                                                               |


## 📑 Org mode <a name="org-mode"/>

>Science is organized knowledge.  
>Wisdom is organized life.  
>**Kant**

Have a look at this [detailed page](./programming_conf/org.md) for more info.  

For now, I use those two :
- [org agenda](https://blog.aaronbieber.com/2016/09/24/an-agenda-for-life-with-org-mode.html)
- [org contact](https://www.reddit.com/r/emacs/comments/8toivy/tip_how_to_manage_your_contacts_with_orgcontacts/)
  
## 🐍 Python <a name="python"/>

>Python is the "most powerful language you can still read".  
>**Paul Dubois**

| state | activation      | action                                                                                                                                   |
|:-----:|:----------------|------------------------------------------------------------------------------------------------------------------------------------------|
| ✅    | auto            | [elpy](https://github.com/jorgenschaefer/elpy)                                                                                           |
| ✅    | auto            | use [flycheck](https://github.com/flycheck/flycheck) instead of flymake                                                                  |
| ✅    | `M-x ein:login` | emacs ipython notebook : [ein](https://github.com/millejoh/emacs-ipython-notebook) and how to [use it](/programming_conf/python_ein.md)  |
| ✅    | `Tab`           | [yasnippet](https://github.com/joaotavora/yasnippet) with custom [snippets](./snippets/python-mode)                                      |

## 💽 Git <a name="git"/>

>Git a life.  
>**Anonymous**

It's [Magit](https://magit.vc/) !

| action     | kbd                                    |
|------------|:---------------------------------------|
| open magit | `C-x g`                                |
| stack      | `s`                                    |
| unstack    | `u`                                    |
| commit     | `c` + `c` + commit message + `C-c C-c` |
| push       | `P` + `p`                              |

# 🙌 Life changing tricks <a name="life-changing-tricks"/>

- on your computer settings : change the <kbd>CapsLk</kbd> key by <kbd>ctrl</kbd>. You're welcome.
- preview markdown file : `M-x markdown-live-preview-mode`
- to make `.emacs` point on the `.emacs.d/init.el` config file, add the following in your `.emacs` file :

  ```lang-el
  (setq user-emacs-directory (file-truename "~/.emacs.d/"))
  (setq user-init-file "~/.emacs.d/init.el")
  (load user-init-file)
  ```
  
- macro :

    | action             | kbd                         |
    |--------------------|:----------------------------|
    | start macro        | `C-x (`                     |
    | end macro          | `C-x )`                     |
    | play macro         | `C-x e`                     |
    | incremental number | `M-x kmacro-insert-counter` |
    | name last macro    | `M-x name-last-kbd-macro`   |
    | call named macro   | `M-x insert-kbd-macro`      |

# 🛈 Source <a name="source"/>

- [.emacs.d](https://github.com/garaud/foggycowinn/tree/master/emacs) by Damien Garaud
- [.emacs.d](https://github.com/daedreth/UncleDavesEmacs) by Dawid Eckert
- [.emacs.d](https://github.com/purcell/emacs.d) by Purcell 
- [.emacs.d](https://github.com/bbatsov/emacs.d) by Bozhidar Batsov 
- [.emacs.d](https://github.com/rememberYou/.emacs.d) by RememberYou  
- [mastering emacs in one year](https://github.com/redguardtoo/mastering-emacs-in-one-year-guide/blob/master/guide-en.org)
- [learn elisp in 15 minutes](https://learnxinyminutes.com/docs/fr-fr/elisp-fr/)

# 📜 License <a name="license"/>

[GPL-3.0 License](https://github.com/tlentali/.emacs.d/blob/master/LICENCE), I choose you ! 
