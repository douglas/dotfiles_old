install: install-vim install-bash install-virtualenvwrapper \
         install-terminal-settings

install-vim:
	rm -rf ~/.vim ~/.vimrc
	ln -s `pwd`/vim ~/.vim
	ln -s ~/.vim/vimrc ~/.vimrc

install-bash:
	rm -f ~/.bashrc ~/.custom_paths ~/.aliases*
	ln -s `pwd`/bash/bashrc ~/.bashrc
	ln -s `pwd`/bash/custom_paths ~/.custom_paths
	ln -s `pwd`/bash/aliases ~/.aliases
	ln -s `pwd`/bash/aliases_mac ~/.aliases_mac
	ln -s `pwd`/bash/aliases_dev ~/.aliases_dev
	source ~/.bashrc

install-virtualenvwrapper:
	cp `pwd`/virtualenvwrapper/* ~/work/ambientes

dump-terminal-settings:
	cp ~/Library/Preferences/com.apple.Terminal.plist terminal
	plutil -convert xml1 terminal/com.apple.Terminal.plist

install-terminal-settings:
ifeq ($(shell uname),Darwin)
	cp ~/Library/Preferences/com.apple.Terminal.plist terminal/old-settings.bak
	cp terminal/com.apple.Terminal.plist ~/Library/Preferences
	@echo "Old terminal settings were saved in terminal folder"
endif
