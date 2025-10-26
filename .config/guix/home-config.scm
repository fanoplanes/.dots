(use-modules (gnu)
             (gnu home)
             (web client)
             (gnu home services shells))

(call-with-output-file "/home/fanoplanes/.config/10-gentoo-color.bash"
  (lambda (port)
    (display (cadr (call-with-values
                       (lambda ()
                         (http-get "https://gitweb.gentoo.org/repo/gentoo.git/plain/app-shells/bash/files/bashrc.d/10-gentoo-color-r2.bash"))
                     list))
             port)))

(define %gentoo-PS1
  (plain-file "gentoo-PS1.sh"
              "source /home/fanoplanes/.config/10-gentoo-color.bash"))

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
            (list "alacritty"
                  "aria2"
                  "aspell"
                  "aspell-dict-en"
                  "btop"
                  "elinks"
                  "emacs"
                  "emacs-lsp-booster"
                  "fastfetch"
                  "fd"
                  "ffmpegthumbnailer"
                  "font-terminus"
                  "fzf"
                  "graphviz"
                  "guile"
                  "guile-gcrypt"
                  "guile-git"
                  "guile-gnutls"
                  "guile-readline"
                  "guile-colorized"
                  "htop"
                  "icecat"
                  "libreoffice"
                  "librewolf"
                  "lynis"
                  "mediainfo"
                  "mpv"
                  "mu"
                  "nss-certs"
                  "offlineimap3"
                  "pandoc"
                  "racket"
                  "ripgrep"
                  "sbcl"
                  "shellcheck"
                  "shfmt"
                  "stow"
                  "tmux"
                  "yt-dlp")))

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
