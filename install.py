import os

exclude = ['README', 'zsh_plugins.txt', 'install.py']

os.system('antibody bundle < zsh_plugins.txt > zsh_plugins.sh')

home = os.path.expanduser('~')
here = os.path.abspath('.')

# symlink all the files in this repo in the home directory
for f in os.listdir('.'):
    if f in exclude or f[0] == '.':
        continue

    local_file = "%s/%s" % (here, f)
    install_file = "%s/.%s" % (home, f)
    if os.path.exists(install_file):
        continue

    cmd = 'ln -sf %s %s' % (local_file, install_file)

    print(cmd)

    os.system(cmd)
