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
+ Add dmenu utils
  + switch monitor setup
	+ connect to new wifi
+ Add default monitor-setup script

+ Polish .examples
+ setup example project deployment (groff, bash, etc)
+ image viewing in vifm (check Luke Smith uberzug config)
+ add ssh keyring (ssh-agent and ssh-add)
+ remove latex?
+ add BitTorrent and RSS utils
+ Add important files from /etc and others
	+ ask user to confirm each change...
  + /etc/ssh/sshd_config
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

+ i3-gaps (Mac: i3)
+ mupdf
+ vifm
+ sxiv
+ neovim
+ rxvt-unicode
+ sc-im (AUR)
+ tig
+ bat
+ fzf
+ zsh
+ zsh-syntax-highlighting
+ (Non-Arch: pacapt - pacman wrapper for other package managers)

These are the rest of my major packages, either not needed or not
available with MacOS.

+ i3blocks
+ urxvt-perls
+ xcompmgr
+ scrot
+ xcape
+ xclip
+ xorg-xmodmap
+ transset-df
+ alsa-utils
+ acpi
+ dunst
+ xdotool
+ dialog
+ hsetroot
  + (using xwallpaper until hsetroot mulit-monitor is fixed)
+ light-locker
+ arc-icon-theme
+ numix-gtk-theme
+ ttf-emojione
+ ttf-fira-code
+ ttf-fira-mono
+ lightdm-webkit-theme-litarvan
+ gtk-engine-murrine
+ unclutter-xfixes-git (aur)
+ light-git (aur)

These packages shouldn't be required by any scripts or configs, but I highly recommend them.

+ reflector
+ htop-vim-git (aur)
+ openssh
+ system-config-printer
+ hplip
+ network-manager-applet (sometime called nm-applet)
+ arandr
+ gimp
+ firefox
+ mpv
+ jq
+ minder-git (aur)

+ wireless_tools
+ iputils
+ make
