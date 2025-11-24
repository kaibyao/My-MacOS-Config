# My OSX Config

I got tired of manually redoing my settings every time I used a new macbook for work or personal use, decided it’d be better to keep my settings in a central location.

## Install in this order

1. Optional: Add the following line to `/etc/hosts/`: `0.0.0.0 ocsp.apple.com` (disables apple phoning home for app verification). Then run: `sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder` (to refresh hosts).

1. Install [Homebrew](https://brew.sh/).

1. Install [Warp Terminal](https://www.warp.dev/).

1. Follow [Github Instructions to set up SSH key](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent).

1. Install the following:
    * Iosevka fonts; see [their GitHub for instructions](https://github.com/be5invis/Iosevka).
    * [Prezto](https://github.com/sorin-ionescu/prezto) and [Powerlevel10k](https://github.com/romkatv/powerlevel10k) for enhanced terminal experience.
    * Other homebrew utils:
        * The latest version of git
        * `brew install bat eza tealdeer fzf` (better/faster `cat`, `ls`, `tldr/man`, and a fuzzy file finder)
    * [difftastic](https://github.com/Wilfred/difftastic) as a mergetool for git
    * Copy git configs from this repo

1. Make Visual Studio Code accessible from command line.
    1. Open Visual Studio Code.app.
    1. Type Command-Shift-P to open the “Run...” menu.
    1. Type “path”. You should see the choices available filter down to 2–3 choices.
    1. Select `Shell Command: Install 'code' command in PATH`.
    1. Now you can open VSCode with the current working folder from your terminal by typing `code .`.

1. Optionally, run the `extra-osx-perf-scripts.sh` script in this repo to disable extra MacOS fluff features (like window transparency, animations, etc). Overall it should speed up your laptop.
    ```shell
    ./extra-osx-perf-scripts.sh
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
