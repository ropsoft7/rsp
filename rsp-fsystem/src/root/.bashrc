# ~/.bashrc for root user

# Ensure we're using the right shell
if [ -z "$PS1" ]; then
    return
fi

# Set history file size and format
HISTSIZE=10000
HISTFILESIZE=20000
HISTCONTROL=ignoredups:erasedups  # avoid duplicate entries
shopt -s histappend  # Append to the history file, don't overwrite

# Set a colorful and informative prompt
# Root prompt will be in red to highlight it's root
PS1='\[\033[01;31m\]\u@\h:\w\[\033[00m\] \[\033[01;32m\]# \[\033[00m\]'

# Load the system-wide bash completion, if available
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# Aliases to simplify common commands
alias ls='ls --color=auto'
alias ll='ls -lh'
alias la='ls -lha'
alias grep='grep --color=auto'
alias df='df -h'
alias du='du -h'
alias free='free -h'
alias top='htop'  # You should install htop first
alias psc='ps aux --sort=-%mem'  # List processes by memory usage
alias lsof='lsof -i'  # List open files, especially network connections

# Safety measures
alias rm='rm -i'  # Always prompt before deleting files
alias mv='mv -i'  # Always prompt before moving files
alias cp='cp -i'  # Always prompt before copying files
alias chmod='chmod -v'  # Verbose output for chmod
alias chown='chown -v'  # Verbose output for chown

# Show an informational message when entering root mode
if [[ $EUID -eq 0 ]]; then
    echo -e "\n\033[01;31m⚠️ You are logged in as root. \n→ Please be cautious when executing commands! ⚠️\033[00m\n"
    echo -e "- Root has unrestricted access to your system. \n- Use 'sudo' for normal tasks whenever possible."
    echo -e "- Always double-check commands to avoid critical mistakes.\n"
fi

# Custom functions
# Check disk space and output a nice summary
function diskspace() {
    echo -e "\nDisk Space Usage Summary"
    df -h
    echo -e "\nTop 5 largest files and directories:"
    du -ah / | sort -rh | head -n 10
}

# Backup function to create tarballs
function backup() {
    if [ -z "$1" ]; then
        echo "Usage: backup <directory_to_backup>"
        return 1
    fi
    tar -czvf "/backup/$(basename $1)_$(date +%Y%m%d%H%M%S).tar.gz" $1
    echo "Backup of '$1' created at /backup/$(basename $1)_$(date +%Y%m%d%H%M%S).tar.gz"
}

# Function to easily update the system
function update_system() {
    echo "Updating the system..."
    apt update && apt upgrade -y
    echo "System is up to date!"
}

# Custom prompt to show the time in the terminal
function timeprompt() {
    echo -e "\n\033[1;34mCurrent system time: \033[0m$(date '+%Y-%m-%d %H:%M:%S')\n"
}

# Load any additional shell configurations
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# For a more visually appealing terminal (optional)
export CLICOLOR=1  # Enable color in terminal
export LSCOLORS=gxfxcxdxbxegedabagacad  # Set colors for ls

# Configure editor (preferably nano or vim for root)
export VISUAL=nano  # Or vim
export EDITOR=nano  # Or vim

# Enable auto-correct for spelling errors in command
shopt -s cdspell

# Enable recursive globbing (e.g., '**/*.txt' to match files in subdirectories)
shopt -s globstar

# Set the default umask to allow group access but restrict world access
umask 022