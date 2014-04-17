#!/usr/bin/env python

import subprocess
import os
import sys

# Assuming we are in dotfiles/bin.
working_dir = os.path.join(os.path.dirname(os.path.realpath(__file__)), '..')

os.chdir(working_dir)
subprocess.call(['git', 'submodule', 'add', sys.argv[1], 'submodules/'+os.path.basename(sys.argv[1])])

