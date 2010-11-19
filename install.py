import os

exclude = ['README', 'install.py']

home = os.path.expanduser('~')
for f in os.listdir('.'):
    if f in exclude or f[0] == '.':
        continue
    cmd = 'ln -s %s %s/.%s' % (f, home, f)
    print cmd
    os.system(cmd)
