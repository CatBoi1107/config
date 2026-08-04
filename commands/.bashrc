#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
export EDITOR=nvim
export HISTSIZE=-1
export HISTFILESIZE=-1
export OLLAMA_NUM_PARALLEL=4

# alias ls='ls --color=auto'
alias ls='eza'
alias grep='grep --color=auto'

alias mati='systemctl poweroff'
alias restart='systemctl reboot'

alias cdhy='cd ~/.config/hypr'
alias cdwb='cd ~/.config/waybar'
alias cdnv='cd ~/.config/nvim'
alias cdqu='cd ~/.config/quickshell'
alias cdwd='cd ~/ThePreservedLexicon/CS/TheDigitalForge/WebDev/'
alias cdui='cd ~/ThePreservedLexicon/CS/CSUI/'
alias cdgs='cd ~/.config/ags/'
alias cddf='cd ~/ThePreservedLexicon/CS/TheDigitalForge/'

alias warpc='warp-cli connect && exit'
alias warpdc='warp-cli disconnect && exit'
alias warpr='warp-cli disconnect && warp-cli connect && exit'
alias warps='warp-cli status'
alias rqu='pkill qs && qs & disown'
alias rhp='pkill hyprpaper && hyprpaper & disown'
alias rwb='pkill waybar && waybar & disown'
alias nmres='sudo systemctl --now restart NetworkManager'

alias nbash='nvim ~/.bashrc'

alias s='yay -Ss'
alias i='yay --needed --noconfirm -S'
alias ui='yay -Rns'
alias apdet='sudo flatpak update && yay --needed --noconfirm -Syu && exit'
alias apdetsh='sudo flatpak update && yay --needed --noconfirm -Syu && mati'
alias anime='ani-cli'
alias lute='cd ~/ThePreservedLexicon/FreakyForest/LuteLang/ && source myenv/bin/activate && python -m lute.main'
alias wrizz='kitty allow_remote_control=yes -e "WallRizz -e -d ThePreservedLexicon/Images"'
alias pathsim='java --module-path /usr/share/java/java-openjfx \
     --add-modules javafx.controls,javafx.fxml,javafx.graphics \
     -Djava.library.path=/usr/lib/java-openjfx \
     -jar ~/ThePreservedLexicon/CS/CSUI/Semester2/POK/PathSim.jar & disown && exit'

alias yt='yt-dlp -S "res:480,vcodec:h264" \
  --merge-output-format mp4 \
  --postprocessor-args "ffmpeg:-c:v libx264 -crf 28 -preset slow -profile:v main -pix_fmt yuv420p -c:a aac -b:a 96k -movflags +faststart" '
alias ig='yt-dlp --cookies-from-browser firefox \
  --merge-output-format mp4 \
  --postprocessor-args "ffmpeg:-vf scale=-2:480 -c:v libx265 -crf 28 -preset slow -profile:v main -pix_fmt yuv420p -c:a aac -b:a 96k -movflags +faststart" '
alias tt='yt-dlp \
  -S "res:480,vcodec:h265" \
  --merge-output-format mp4 \
  --postprocessor-args "ffmpeg:-vf scale=-2:480 -c:v libx265 -crf 28 -preset slow -profile:v main -pix_fmt yuv420p -c:a aac -b:a 96k -movflags +faststart" '

alias tenv='source venv/bin/activate'

alias dorong='git push -u origin main'
alias gitaccCB='git config --local user.name "CatBoi1107" && git config --local user.email "therealjohnsmith1256@gmail.com"'
alias gitaccUI='git config --local user.name "AhmadCSUI" && git config --local user.email "ahmad.shanahan@ui.ac.id"'
alias gitaccASZ='git config --local user.name "aszorya" && git config --local user.email "ahmadszorya@gmail.com"'
alias komit='git add . && git commit -m'

alias junit='java -cp .:/usr/share/java/junit.jar org.junit.runner.JUnitCore'
# PS1='[\u@\h \W]\$ '
PS1='< \W > '
alias synckb='scrcpy -e --no-video --no-audio --keyboard=uhid'

alias nvint='sudo envycontrol -s integrated'
alias nvhyb='sudo envycontrol -s hybrid'
alias nvgpu='sudo envycontrol -s nvidia'

# https://en.wikipedia.org/wiki/ANSI_escape_code
# PS1="\e[38;5;61m\W \e[38;5;71m\$ \[\e[0m\]"
# pnpm
export PNPM_HOME="/home/h/.local/share/pnpm"
export CLASSPATH=".:/usr/share/java/junit.jar"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
