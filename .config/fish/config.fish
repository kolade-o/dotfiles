if status is-interactive
    # Commands to run in interactive sessions can go here
end

# autostart
starship init fish | source
kubectl completion fish | source
nvm use

set -gx KUBECTL_CONTEXT castle
set -gx KUBECTL_NAMESPACE release88
set -gx HELM_RELEASE release88
set -gx NODE_ENV loopback
#set -gx PATH $PATH $HOME/.local/bin
#alias
alias k="kubectl"
alias kctx="kubectl ctx"
alias kns="kubectl ns"
alias mongo="mongosh"
alias editfish="nvim ~/.config/fish/config.fish"
alias sourcefish="source ~/.config/fish/config.fish && cp ~/.config/fish/config.fish ~/config/.config/fish/config.fish"
alias !!='commandline -i "sudo $history[1]";history delete --exact --case-sensitive !!'
alias sourcefish="source ~/.config/fish/config.fish && cp ~/.config/fish/config.fish ~/config/.config/fish/config.fish"
alias editnvim="nvim ~/.config/nvim/"

alias gs="git status"
alias ga="git add"
alias gc="git commit -m"
alias gp="git push"
alias gpl="git pull"
alias gst="git stash"
alias gsp="git stash; git pull"
alias gcheck="git checkout"

alias vim="nvim"
alias cdops="cd ~/recordsure/operations"
alias cdconfig="cd ~/recordsure/config.recordsure.com"
alias android-emulator="~/Android/Sdk/emulator/emulator -feature -Vulkan @Medium_Phone_API_35"

function ll
	ls -l $argv
end

function dev-flutter-watch
  cd $argv[1]
  tmux new-session -d
	tmux send-keys "android-emulator" Enter \;\
  split-window -v \;\
  send-keys "sleep 5 && flutter run $1 $2 $3 $4 --pid-file=/tmp/tf1.pid" Enter \;\
  split-window -v \;\
  send-keys 'sleep 20 && npx -y nodemon -e dart -x "cat /tmp/tf1.pid | xargs kill -s USR1"' Enter \;\
  resize-pane -y 5 -t 1 \;\
  select-pane -t 0 \;
  sleep 5
  nvim .
end

