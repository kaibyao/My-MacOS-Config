# My OSX Config

I got tired of manually redoing my settings every time I used a new macbook for work or personal use, decided it’d be better to keep my settings in a central location.

## Install in this order:

1. Moom

2. iterm

3. git (run `git` first to sign licenses for XCode Developer Tools)

4. [Homebrew](http://brew.sh/).

5. zsh

	```
	# install zsh
	brew install zsh

	# add shell path
	sudo vim /etc/shells

	# add the following line into the very end of the file(/etc/shells)
	/usr/local/bin/zsh

	# change default shell
	chsh -s /usr/local/bin/zsh
	```

6. Prezto

7. [nvm](https://github.com/creationix/nvm)

8. Sublime Text

9. VSCode

10. Sketch

11. Omnigraffle
