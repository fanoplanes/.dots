#! /usr/bin/env python
from subprocess import check_output

def get_pass():
    return check_output("gpg -dq ~/.config/offlineimap/offlineimappass.gpg", shell=True).rstrip(b"\n")
