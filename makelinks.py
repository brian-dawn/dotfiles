
import os

script_dir = os.path.dirname(os.path.realpath(__file__))
home_dir   = os.path.expanduser('~')
script_name = os.path.basename(__file__)

links_to_make = [f for f in os.listdir(script_dir) if not f==script_name and not f[0] == '.']

target = [os.path.join(home_dir, '.' + f) for f in links_to_make]
source = [os.path.join(script_dir, f) for f in links_to_make]

for t, s in zip(target, source):
    try:
        os.symlink(s, t)
        print(s, '->', t)
    except:
        pass

