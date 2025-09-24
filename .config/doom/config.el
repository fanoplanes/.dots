;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Show battery status in the modeline.
(display-battery-mode)

;; Maximize Emacs on startup
(add-to-list 'initial-frame-alist '(fullscreen . maximized))
;; Remove decorations (title bar, buttons nonsense)
(add-to-list 'default-frame-alist '(undecorated . t))
;; Don't bother me with "really quit?" nonsense
(setq confirm-kill-emacs nil)

;; Hehe, I'm pulling a git repo of banners as a package, this selects a "vim" one for the dash.
(setq fancy-splash-image "~/.config/emacs/.local/straight/repos/doom-banners/splashes/others/emacs-logo-vim.png")

;;set SPC r for rss
(map! :leader :g "r" #'newsticker-show-news)

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:

(setq helper-fontsize
      (cond ((string= (system-name) "krabica") 20)
            ((string= (system-name) "thinkpad") 18)
            (t 18)))

(setq doom-font (font-spec :family "Terminess Nerd Font"
                           :size helper-fontsize)

      doom-variable-pitch-font (font-spec :family "Terminess Nerd Font Propo"
                                          :size helper-fontsize))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; Give dirvish more reasonable layout (not quite 50:50, but almost)
(after! dirvish
  (setq dirvish-default-layout '(0 0 0.55)))

;; redefine newsticker url browsing so that it doesn't automatically move to the next item
(defun newsticker-treeview-browse-url-custom ()
  "Call `browse-url' for the link of the item at point."
  (interactive)
  (with-current-buffer (newsticker--treeview-list-buffer)
    (let ((url (get-text-property (point) :nt-link)))
      (when url
        (browse-url url)
        (if newsticker-automatically-mark-visited-items-as-old
            (newsticker-treeview-mark-item-old dont-proceed))))))
(map! :map newsticker--treeview-url-keymap "RET" 'newsticker-treeview-browse-url-custom)

;; Define feeds
(setq newsticker-url-list
   '(("SK-CERT" "https://www.sk-cert.sk/index.html%3Ffeed=rss" nil nil nil)
     ("Hacker News" "https://news.ycombinator.com/rss" nil nil nil)
     ("Lobsters" "https://lobste.rs/rss" nil nil nil)
     ("Arch News" "http://www.archlinux.org/feeds/news/" nil nil nil)
     ("Kernel" "http://kernel.org/kdist/rss.xml" nil nil nil)
     ("Quanta Magazine" "https://www.quantamagazine.org/feed/" nil nil nil)
     ("sizeof(cat)" "https://sizeof.cat/index.xml" nil nil nil)
     ("XKCD" "https://xkcd.com/rss.xml" nil nil nil)))

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
