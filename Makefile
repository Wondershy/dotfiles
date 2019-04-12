stow = stow -v -t ~ 
i3dir = i3/.config/i3
i3files = $(i3dir)/i3config_base $(i3dir)/i3config_keyboard $(i3dir)/i3config_gaps $(i3dir)/i3config_workspaces $(i3dir)/i3config_autorun $(i3dir)/i3config_mpd $(i3dir)/i3config_oblogout

.PHONY: all vim polybar mpd i3 packages i3config 



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
$(i3files):
$(i3dir)/config: $(i3files) 
	cat $^ > $@

i3config: $(i3dir)/config

i3: vim polybar $(i3dir)/config
	$(stow) i3
	$(stow) rofi

vim:
	$(stow) vim

polybar:
	$(stow) polybar
