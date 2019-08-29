#!/usr/bin/env python3

import os
import sys
def main():
    """this is main function."""
    args = sys.argv
    if(len(args) == 1):
        print("nothing selected")
        return
    tokens = args[1].split(":")
    process = "+" + tokens[1] + " " + tokens[0]
    _cmd = os.environ["myvi"] + " " + process
    os.system(_cmd)

if __name__ == '__main__':
    main()
