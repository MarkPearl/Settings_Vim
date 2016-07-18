# Find string in any file
# -print0 adds a null char to the end of every result of find
# -0 for xargs makes xargs look for the null char as the terminating char for the arg. This makes it work for paths that contain spaces
# find * -name "*.sql" -print0 | xargs -0 grep -i 'findit'

### General Section

# Turn on vi mode in bash
set -o vi

# bash aliases
alias lsl='ls -al'
alias profile='ed ~/.bashrc &'
alias reload='. ~/.bashrc'
alias ll='ls -aFl --color=always'
alias e='v'

# git aliases
alias g='git'
alias gaa='git add -A && git status'
alias gau='git add -u'
alias gs='git status'
alias gst='git status -s'
alias gl='git log --pretty="%Cred %h %Cgreen %ci %Cgreen %ai %Cred %an % s"'
alias gb='git branch'
alias gbg='git branch | grep -i'
alias gbh='git reflog | grep checkout: | sed "s/.*moving from //" | sed "s/ to .*//" | less'
alias gc='git clean -d -f'
alias gcam='git commit -am'
alias gd='git diff'
alias gdi='git diff --cached'
alias gdl='git diff --name-only'
alias gdt='git difftool'
alias gdlast='git diff HEAD^..HEAD'
alias gdtlast='git difftool HEAD^..HEAD'
alias gm='git commit -m'
alias grh='git reset --hard'
alias gundo='git reset --soft HEAD^'
alias gswitch='git checkout -'
alias remove.one='git reset --hard HEAD~1'
alias undocommit='git reset --soft HEAD^1'
alias squash='git merge --squash --ff '
alias log='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit --date=relative'
alias merge='git mergetool'
alias showfiles='git show --pretty="format:" --name-only'
alias co='git checkout'
alias cod='git checkout develop'
alias diffcommits='git diff --name-only' #Provide SHA's as arguments to diff between them e.g. 'diffcommits 887a2a7d b9e7a751'
alias cleanslate='git clean -df && git reset --hard'
alias branchescontaining='git branch --contains' # Lists branches containing all commits from specified branch eg. 'git branch --containing SomeBranch'
alias getcurrentbranch='git rev-parse --abbrev-ref HEAD'
alias capturecurrentbranch='currentbranch=$(getcurrentbranch)'
alias branches='git for-each-ref --sort=-committerdate --format="%(refname) | %(subject)" refs/heads/ | less'

# TortoiseGit aliases
alias tlog='tortoisegitproc /command:log'

# Misc aliases
alias ex='explorer .'
alias v='gvim'
alias st='sublime_text'

# Function to start editor with forked process
ed()
{
	e $1 &
}

### KeyBlade / FirstRand Section

# Turn on finicky http proxy setting
export HTTP_PROXY=http://bluecoat.rmb.co.za:8080
export HTTPS_PROXY=https://bluecoat.rmb.co.za:8080
# export HTTP_PROXY=http://localhost:8090
# export HTTPS_PROXY=https://localhost:8090

# Exports
export kbrepo=c:/src/git/KeyBlade
export wiki=c:/src/git/Wiki
export fmlrepo=c:/src/fml
export gitrepos=d:/Janco/gitrepos
export vsdevenv="C:\\Program Files (x86)\\Microsoft Visual Studio 11.0\\Common7\\IDE\\devenv.exe"
export pprweb="//rmb-ppr-kbld01"
export pprapp="//rmb-ppr-kbld02"

# KeyBlade specific git aliases
alias latest='cd $kbrepo && git fetch origin && git checkout develop && git rebase origin/develop' # git fetch origin && git rebase origin/develop'
alias ud='git pull --rebase origin develop'
alias rd='git rebase develop'
alias pushdev='git push origin develop'
#alias syncdev='capturecurrentbranch && latest && git checkout $currentbranch && git rebase develop'
alias syncdev='latest && git checkout - && git rebase develop'
#alias syncdevb='capturecurrentbranch && latest && build && git checkout $currentbranch && git rebase develop && build'
alias syncdevb='syncdev && build'
alias nextdeploy='powershell $kbrepo/changes-to-deploy.ps1'

# KeyBlade build aliases
alias build='cd $kbrepo/ && ./build.sh && cd ..'
alias buildprod='cd $kbrepo/ && rake build[Production] && cd ..'
alias clean='cd $kbrepo/ && rake build_solutions:clean_keyblade && rake build_solutions:clean_common'
alias bc='cd $kbrepo/Common/ && ./build-common.sh'
#alias bc='cd $kbrepo/ && rake build_solutions:build_common && cd ..'
alias bkb='cd $kbrepo/ && rake build_solutions:build_keyblade && cd ..'
alias compile='cd $kbrepo && rake build'
alias deploy_wcf='cd $kbrepo/ && rake service:deploy_wcf'
alias deploy_signalrhost='cd $kbrepo/ && rake service:deploy_signalrhost'
alias deploy_dev_settings='stopsettings & cp -v $kbrepo/KeyBlade.Services.Host/EnvironmentSettings/Settings.xml c:/KeyBlade.Services/EnvironmentSettings && startsettings'
alias copy_dev_settings='cp $kbrepo/KeyBlade.Services.Host/EnvironmentSettings/Settings.xml $kbrepo/KeyBlade.Services.Host/bin/debug/EnvironmentSettings'
alias refresh_settings='cp -v $kbrepo/KeyBlade.Services.Host/EnvironmentSettings/Settings.xml $kbrepo/KeyBlade.Services.Host/bin/Debug/EnvironmentSettings'
alias deploy_console='rm -rf /c/KeyBlade.Console/ && mkdir /c/KeyBlade.Console && cp $kbrepo/KeyBlade.UI.Console/bin/Debug/* /c/KeyBlade.Console/'
alias buildlatest='latest && build'
alias stopgeneral='sc stop "KeyBladeWCFServices\$KeyBladeGeneralServices"'
alias stopsettings='sc stop "KeyBladeWCFServices\$KeyBladeSettings"'
alias stopmsgsrv='sc stop "Keyblade.MessageService.KeyBlade"'
alias startsettings='sc start "KeyBladeWCFServices\$KeyBladeSettings"'
alias stopall='stopgeneral & stopsettings & stopmsgsrv'
alias kbsettings='ed $kbrepo/KeyBlade.Services.Host/EnvironmentSettings/settings.xml'

# FinLib build aliases
alias fbc='cd $fmlrepo/KeyBlade/ && rake build_solutions:build_common && cd ..'
alias fbcprod='cd $fmlrepo/ && rake build_solutions:build_common[Production] && cd ..'
alias fbkb='cd $fmlrepo/ && rake build_solutions:build_keyblade && cd ..'
alias bfml='fbc && msbuild.exe $fmlrepo/FinLibwTests.sln'
alias fmllatest='cd $fmlrepo/ && git svn fetch && git svn rebase'

# KeyBlade project aliases
alias kb='start $kbrepo/keyblade.sln'
alias ka='"$vsdevenv" $kbrepo/keyblade.acceptance.sln &'
alias monitur='start $kbrepo/KeyBlade.Utilities/KeyBlade.MoniturV4/KeyBlade.Monitur.sln'
alias monui='powershell -Command $kbrepo/KeyBlade.Utilities/KeyBlade.MoniturV4/build.ps1 -buildEnvironment Live && start $kbrepo/KeyBlade.Utilities/KeyBlade.MoniturV4/KeyBlade.Monitor.WPF/bin/Live/KeyBlade.Monitor.WPF.exe'
alias common='start $kbrepo/Common/keyblade.Common.sln'
alias sensors='start $kbrepo/KeyBlade.Utilities/KeyBlade.MoniturV4/components.xml'
alias utils='"$vsdevenv" $kbrepo/KeyBlade.Utilities/KeyBlade.Utilities.sln &'
alias fml='"$vsdevenv" $fmlrepo/FinLibwTests.sln &'
alias ldm='"$vsdevenv" c:\\src\\git\\LDM\\LQDMPOC.sln &'
alias kbc='$kbrepo/KeyBlade.UI.Console/bin/Debug/KeyBlade.UI.Console.exe'
alias badt='powershell -command "cd $kbrepo\KeyBlade.Utilities\KeyBlade.adTempus.Client;.\build.ps1"'
#alias adt='$kbrepo/KeyBlade.Utilities/KeyBlade.adTempus.Client/adTempus.Client/bin/debug/adTempus.Client.exe'
alias adtljpa='adtcli listjobs -s rmb-ppr-kbld02 -r "Active Jobs"'
alias adtljpe='adtcli listjobs -s rmb-ppr-kbld02 -e'
alias adtljpf='adtcli listjobs -s rmb-ppr-kbld02 -f'
alias rungeneral='$kbrepo/KeyBlade.Services.Host/bin/Debug/KeyBlade.Services.Host.exe -instance:KeyBladeGeneralServices'
alias runsettings='cd $kbrepo/KeyBlade.Services.Host && $kbrepo/KeyBlade.Services.Host/bin/Debug/KeyBlade.Services.Host.exe -instance:KeyBladeSettings'
alias runsettingsnew='$kbrepo/KeyBlade.Services.Settings/bin/Debug/KeyBlade.Services.Settings.exe -instance:KeyBladeSettings'
alias runcmdsrv='$kbrepo/KeyBlade.Services.Host/bin/Debug/KeyBlade.Services.Host.exe -instance:KeyBladeCommandService'
alias runmsgsrv='$kbrepo/KeyBlade.MessageService.KeyBlade/bin/Debug/NServiceBus.Host.exe'
alias runpat='$kbrepo/../MicroServices/PostmanPat/PostmanPat/bin/Debug/KeyBlade.PostmanPat.exe'
alias kbsettings='e $kbrepo/KeyBlade.Services.Host/EnvironmentSettings/settings.xml &'

# KeyBlade browser aliases
alias web.chrome='"~\AppData\Local\Google\Chrome\Application\chrome.exe" http://localhost/ui.web &'
alias web.ie='"C:\Program Files (x86)\Internet Explorer\iexplore.exe" http://localhost/ui.web &'
alias web.chrome.production='"~\AppData\Local\Google\Chrome\Application\chrome.exe" http://keyblade &'
alias web.ie.production='"C:\Program Files (x86)\Internet Explorer\iexplore.exe" http://keyblade &'

# Financial Modeling Library aliases
alias fmlservices='"$fmlrepo/KeyBlade.FinancialModeling.Services.Host/bin/Debug/KeyBlade.FinancialModeling.Services.Host.exe" console -instance:FinancialModelingServices'

# Misc aliases
alias httpgetjson='curl --ntlm --user rmb-nt\\s_keyblade:Designer@1 --noproxy 127.0.0.1,localhost -H "Content-Type:application/json" -X GET'
alias httppostjson='curl --ntlm --user rmb-nt\\s_keyblade:Designer@1 --user rmb-nt\\s_keyblade:Designer@1 --noproxy 127.0.0.1,localhost -H "Content-Type:application/json" -X POST'

alias synch='/I/Group\ Treasury/Development/synchsvn.sh'

# sneaky alias inserted by Steve
alias vskeyblade='start /c/src/git/KeyBlade/KeyBlade.sln'

