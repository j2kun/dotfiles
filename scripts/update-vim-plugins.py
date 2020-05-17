from os.path import expanduser
import os
import subprocess

home = expanduser("~")
vim = os.path.join(home, '.vim')
bundle = os.path.join(vim, 'bundle')


def update_one(author, plugin_name):
    plugin_dir = os.path.join(bundle, plugin_name)
    if not os.path.exists(plugin_dir):
        git_url = 'git://github.com/{}/{}.git'.format(author, plugin_name)
        subprocess.check_call("git clone {} {}".format(git_url, plugin_dir), shell=True)
    else:
        os.chdir(plugin_dir)
        subprocess.check_call("git pull", shell=True)


if __name__ == "__main__":
    with open(os.path.join(vim, 'vim-plugins.txt'), 'r') as plugin_list:
        for line in plugin_list:
            print("=" * 50)
            print("Updating %s" % line.strip())
            author, plugin_name = line.strip().split('/')
            update_one(author, plugin_name)
