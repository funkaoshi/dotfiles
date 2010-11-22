import os

exclude = ['README', 'install.py']

home = os.path.expanduser('~')
here = os.path.abspath('.')
for f in os.listdir('.'):
    if f in exclude or f[0] == '.':
        continue
    local_file = "%s/%s" % (here, f)
    install_file = "%s/.%s" % (home, f)
    cmd = 'ln -sf %s %s' % (local_file, install_file)
    print cmd
    os.system(cmd)
