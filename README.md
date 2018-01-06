# My OSX Config

I got tired of manually redoing my settings every time I used a new macbook for work or personal use, decided it’d be better to keep my settings in a central location.

## Install in this order:

1. Open a new terminal window using Terminal.app.

1. Run the following to install XCode Developer Tools: `xcode-select --install`.

1. Create a public SSH key: `printf "\n\n\n" | ssh-keygen`.

1. Copy and paste this SSH key to your GitHub profile.
    1. Copy and paste this command into Terminal and hit enter: `cat ~/.ssh/id_rsa.pub | pbcopy`. This copies your newly created SSH key to your clipboard. Should you accidentally copy other text afterwards, go ahead and paste this command into Terminal and it’ll recopy the SSH key.
    1. Go to [Your GitHub SSH keys](https://github.com/settings/keys)
    1. Click “New SSH key”.
    1. Title your key (“Connectiv Laptop” works).
    1. Paste the output that you copied into the “Key” field.
    1. Click “Add SSH key”.

1. Add your Connectiv email address to your GitHub profile
    1. [Your GitHub emails](https://github.com/settings/emails)
    1. Enter your email address to the “Add email address” field. Click “Add”.

1. Clone this repo and run the first setup script.
    ```shell
    cd ~/Downloads
    printf 'y\n' | git clone git@github.com:theconnectiv/laptop-setup.git
    cd laptop-setup
    ./setup-1.sh
    # extra line break to ensure the above gets run
    ```

1. Close your current Terminal.app window, and open a new one. Make sure zsh is your current shell.
    ```shell
    echo $SHELL
    # should return: /usr/local/bin/zsh
    ```

1. Run the second setup script.
    ```shell
    cd ~/Downloads/laptop-setup
    sudo -v
    ./setup-2.sh
    # extra line break to ensure the above gets run
    ```

1. Make Visual Studio Code accessible from command line.
    1. Open Visual Studio Code.app.
    1. Type Command-Shift-P to open the “Run...” menu.
    1. Type “path”. You should see the choices available filter down to 2–3 choices.
    1. Select `Shell Command: Install 'code' command in PATH`.
    1. Now you can open VSCode with the current working folder from your terminal by typing `code .`.

1. Optionally, run the `osx/extra-osx-perf-scripts.sh` script in this repo to disable extra MacOS fluff features (like window transparency, animations, etc). Overall it should speed up your laptop.
    ```shell
    ./osx/exra-osx-perf-scripts.sh
    ```

1. Install Moom
    1. General preferences
        1. Check `Launch automatically on login`
        1. Uncheck `Show preferences on launch`
        1. Run as `menu bar` application
    1. Mouse (leave alone)
    1. Keyboard
        1. Check `Show cheat sheet` and `Repeat to show grid`
        1. Command held: `Move to other display`
        1. Auto-dismiss keyboard control after:
            1. Check `Move & Zoom`
            1. Uncheck `Move, Grow, Shrink`
            1. Check `Other actions`

1. (Optional) Sublime Text setup

1. (Optional) Sketch setup

1. (Optional) Omnigraffle setup
