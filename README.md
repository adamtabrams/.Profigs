# .Profigs
These are my current system configurations and .RCs
A lot of credit is due to Luke Smith.
I took inspiration from his setup and have borrow some of his scripts
and configs.


### To Use
First, clone or download this DIRECTLY to your $HOME directory (these files are intended only for Linux systems)

To ensure the directory is in the correct location and to see which
files and directories it contains, run: ls $HOME/.Profigs/

Now you can run $HOME/.Profigs/linkprofigs to create
symlinks to each of the config files and directories.

Note: The script will print a lot of output, that verbosity is
intended. Nothing is overwritten by the script. Old
configuration files will be stored in
$HOME/.old-configs/{data-time}.


### Todo
+ Add important files from /etc and others
	+ ask user to confirm each change...
  + /etc/pacman.conf
	  + Color
	  + ILoveCandy
	  + CheckSpace (maybe default)
  + /etc/lightdm/lightdm.conf
    + point to webkit
		+ blah-display-setup-script=xdotool mousemove 100 100
  + /etc/lightdm/lightdm-webkit2-greeter.conf
	  + set to litarvan


### List of Programs
These are packages as found in the official Arch repos.

These are my most important programs, and they can all be used on a Mac with Homebrew.

+ mupdf
+ vifm
+ sxiv
+ neovim
+ rxvt-unicode
+ sc-im (AUR)
+ lazygit
+ tig
+ bat
+ fzf
+ jq
+ sshfs
+ httpie
+ zsh
+ zsh-syntax-highlighting
+ (Non-Arch: pacapt - pacman wrapper for other package managers)

These are the rest of my major packages, either not needed or not
available with MacOS.

+ i3-gaps
	+ (i3 no longer in Brew repo)
	+ maybe try amethyst
	+ or xmonad
+ i3blocks
+ urxvt-perls
+ xcompmgr
+ scrot
+ xcape
+ xclip
+ xorg-xmodmap
+ transset-df
+ pulseaudio
+ pulseaudio-alsa
+ pulsemixer
+ acpi
+ dunst
+ xdotool
+ dialog
+ docx2txt
+ odt2txt
+ hsetroot
  + (using xwallpaper until hsetroot mulit-monitor is fixed)
+ light-locker
+ gnome-keyring
+ arc-icon-theme
+ numix-gtk-theme
+ ttf-emojione
+ ttf-fira-code
+ clipmenu
+ clipnotify
+ lightdm-webkit-theme-litarvan
+ gtk-engine-murrine
+ unclutter-xfixes-git (aur)
+ light-git (aur)
+ menu-calc (aur)

These packages shouldn't be required by any scripts or configs, but I highly recommend them.

+ reflector
+ htop-vim-git (aur)
+ openssh
+ system-config-printer
+ hplip
+ network-manager-applet (sometime called nm-applet)
+ arandr
+ dict
+ irssi
+ gimp
+ firefox
+ mpv
+ minder-git (aur)

+ wireless_tools
+ iputils
+ make
+ ctags
+ cscope
+ entr

### Testing Programs
+ cht.sh
+ sc-im
+ tig vs lazygit
+ aspell, proselint
+ MEGA
+ Remmina
+ valgrind
+ emacs
