import os
import shutil
import subprocess

exclude = ['README', 'install.py', 'starship.toml']

home = os.path.expanduser('~')
here = os.path.abspath('.')

# symlink all the files in this repo in the home directory
print("Symlinking dotfiles ...")
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

# starship prompt used by my zsh setup.
if shutil.which('starship'):
    print('starship already installed, skipping')
else:
    print('Installing starship...')
    subprocess.run(
        'curl -sS https://starship.rs/install.sh | sh -s -- --yes',
        shell=True, check=True
    )

starship_config_dir = os.path.join(home, '.config')
starship_config = os.path.join(starship_config_dir, 'starship.toml')
starship_source = os.path.join(here, 'starship.toml')

if not os.path.islink(starship_config):
    os.makedirs(starship_config_dir, exist_ok=True)
    cmd = 'ln -sf %s %s' % (starship_source, starship_config)

    print(cmd)
    
    os.system(cmd)
