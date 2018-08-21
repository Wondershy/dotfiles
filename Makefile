.PHONY: vim polybar mpd i3 packages 

stow = stow -v -t ~ 

all: packages i3 mpd


packages:
	xargs -d '\n' -a packages/package.list yay --noconfirm --needed -S 

###
### mpd
###
mpd:
	$(stow) mpd
	mkdir -p ~/.mpd
	touch ~/.mpd/{log,pid,state,database,playlists}

###
### I3WM
###
i3: vim polybar
	$(stow) i3
	$(stow) rofi

vim:
	$(stow) vim

polybar:
	$(stow) polybar
