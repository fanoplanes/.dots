(use-modules (gnu)
             (gnu home)
             (gnu home services shells))

(define %gentoo-PS1
 (plain-file "gentoo-PS1.sh"
  "source /usr/share/gentoo-color-bash/10-gentoo-color.bash"))

(define %ugh
 (plain-file "ugh.sh"
  "ugh () {
    xdg-open https://duckduckgo.com/?q=linux+\"$(fc -ln -2 | head -n 1 | awk \"{print $1}\")\"
   }"))

(define %doom
 (plain-file "doom-to-path.sh"
  "if [ -f \"$HOME/.config/emacs/bin/doom\" ]; then
     PATH=\"$HOME/.config/emacs/bin:$PATH\"
   fi"))

(home-environment
 (packages (specifications->packages
            (list "emacs"
                  "emacs-lsp-booster"
                  "pandoc"
                  "offlineimap3"
                  "mu"
                  "icecat"
                  "btop"
                  "librewolf"
                  "nss-certs"
                  "ripgrep"
                  "fd"
                  "elinks"
                  "racket"
                  "sbcl"
                  "guile")))

 (services (list (service home-bash-service-type
                          (home-bash-configuration
                           (environment-variables '(("EDITOR" . "emacs -nw")
                                                    ("RANGER_LOAD_DEFAULT_RC" . "FALSE")))
                           (aliases '(("edit" . "emacs -nw")
                                      ("e" . "edit")
                                      ("se" . "sudoedit")
                                      ("ls" . "ls --color=auto")
                                      ("grep" . "grep --color=auto")
                                      ("pg" . "/home/fanoplanes/.local/bin/test-internet.rkt")))
                           (bashrc (list %doom %ugh %gentoo-PS1)))))))
