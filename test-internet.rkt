#lang racket/base

(require racket/port
         racket/system)

(define bold (with-output-to-string (lambda () (system "tput bold"))))
(define normal (with-output-to-string (lambda () (system "tput sgr0"))))

(define (ping address)
  (define blurb (string-append "echo" " \"" bold "Pinging " address ":" normal "\""))
  (system blurb)
  (system "echo \"---------------------------\"")
  (system "echo")
  (define command (string-append "ping -c 1 -a -W 2 " address))
  (define exit-code (system command))
  (system "sleep 1")
  (system "echo")
  (system "echo")
  exit-code)

(define pingable (list "192.168.1.109" "192.168.1.100" "192.168.1.1" "gnu.org"))

(define (ping-addresses)
  (for/and ([ip pingable])
    (if (ping ip)
        #t
        (begin
          (system "echo")
          (system (string-append "echo " bold "\"" "Could not ping " ip normal "\""))
          #f))))

(if (ping-addresses)
    (begin
      (system (string-append "echo " bold "\"" "All addresses pinged successfully!" normal "\""))
      (values))
    (values))
