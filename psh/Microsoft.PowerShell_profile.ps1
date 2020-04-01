# <Continue to add your own>
function profile {_vim $profile}
Set-Alias ali profile

# how to use: type "$ . Reload-Profile"
function Reload-Profile{
    @(
            $Profile.AllUsersAllHosts,
            $Profile.AllUsersCurrentHost,
            $Profile.CurrentUserAllHosts,
            $Profile.CurrentUserCurrentHost
     ) | % {
        if(Test-Path $_){
            Write-Verbose "Running $_"
                . $_
        }
    }
}
Set-Alias soali Reload-Profile

function _cd{
# for pipelines to work
    [CmdletBinding()]
        param(
                [Parameter(ValueFromPipeline)]
                $_cd_paths
             )
            if($_cd_paths -eq $null){
                Set-Location $home
            }else{
                Set-Location $_cd_paths
            }

#if ($args.count -eq 0){
#    Set-Location $home
#}
#else{
#    Set-Location @args
#}
}
Set-Alias -Name cd -Value _cd -Option AllScope
Import-Module PSReadLine
Import-Module PSFzf # must be after PSReadLine
Set-PSReadLineOption -EditMode Emacs
function ch{c $home}
function cmdh{c $env:cmder_root}
function cl{
    [CmdletBinding()]
        param(
                [Parameter(ValueFromPipeline)]
                $_cd_paths
             )
            _cd $_cd_paths
            _ls
}
function c{ cl @args; }
Set-Alias v _vim
function _ls{Get-ChildItem -name @args -Force}
Set-Alias l _ls
Set-Alias -Name ls -Value _ls -Option AllScope
function ll{Get-ChildItem}
function _vim{gvim @args}
# function _vim{gvim --servername DKVIM --remote @args}
function vimrc {_vim $home\dkenv\runtime_config\vim\.vimrc}
function vimdir{cd $home\.vim}

# function which($name){where.exe $name}
function which($name){
    Get-Command $name | Select-Object -ExpandProperty Definition
}

# ZLocation
# the following command does not work with cmder. We need a patch.
# Import-Module ZLocation; Add-Content -Value "`r`n`r`nImport-Module ZLocation`r`n" -Encoding utf8 -Path $profile.CurrentUserAllHosts

[ScriptBlock]$PrePrompt = {
    Update-ZLocation $pwd
}

$env:term='' # for fzf to work in Fluent Terminal
function cz{ z | python -c "z=list(__import__('sys').stdin); z=[s.strip().split() for s in z]; z=[l[1] for l in z[3:-2]]; print('\n'.join(z))" | fzf | cl }
function cx{ fd }

#Import-Module posh-git

function mc{ mkdir @args; cd @args }

function sudo{
    echo "imprtnt MYMSG: if you want to preserve the window, just sudo . powershell";
        Sudo.exe @args;
}

function hello{
    [CmdletBinding()]
        param(
                [Parameter(ValueFromPipeline)]
                [string[]]$my_arg,
                [Parameter][string[]]$another
             )
            echo "1";
            echo $my_arg;
            echo "2";
            echo $another;
}

function oaf{
    ii @args
}

function make-link ($target, $link){
    New-Item -Path $link -ItemType SymbolicLink -Value $target
}

function gst(){
    git status
}

function gitall(){
    cd ~/dkenv/runtime_config
    git pull
    git add .
    git commit -m "push all"
    git push

    cd ~/dkenv
    git pull
    git add .
    git commit -m "push all"
    git push
}


set-alias ex exit

function _gdb(){
    gdb.exe -x $home\.gdbinit @args
}
set-alias gdb _gdb

function gdbinit(){
    _vim ~/.gdbinit
}

function vsdir(){
    cl ~/source/repos
}

function kuics_site(){
    _vim ~/projects/kuics/kuics_site.txt
}

function psql_u(){
    psql -U postgres
}

function hw(){
    psql -U postgres -d practice
}

function psql_s(){
    psql -U postgres -f main.sql
}

function query(){
    psql -U postgres -f query.sql
}


function vm(){
    _vim main.*
}

function bb(){
    start-process chrome.exe "https://kulms.korea.ac.kr/webapps/portal/execute/tabs/tabAction?tab_tab_group_id=_2_1"
}

function bb_ca(){
    start-process chrome.exe "https://kulms.korea.ac.kr/webapps/blackboard/execute/announcement?method=search&context=course_entry&course_id=_155677_1&handle=announcements_entry&mode=view"
}

function bb_cn(){
    start-process chrome.exe "https://kulms.korea.ac.kr/webapps/blackboard/execute/announcement?method=search&context=course_entry&course_id=_165361_1&handle=announcements_entry&mode=view"
}

function bb_db(){
    start-process chrome.exe "https://kulms.korea.ac.kr/webapps/blackboard/execute/announcement?method=search&context=course_entry&course_id=_155689_1&handle=announcements_entry&mode=view"
}

function bb_os(){
    start-process chrome.exe "https://kulms.korea.ac.kr/webapps/blackboard/execute/announcement?method=search&context=course_entry&course_id=_155681_1&handle=announcements_entry&mode=view"
}

function bb_pl(){
    start-process chrome.exe "http://prl.korea.ac.kr/~pronto/home/courses/cose212/2019/"
}

function r-cpp(){
    g++ main.cpp; ./a
}

# set-alias csc C:\Windows\Microsoft.NET\Framework64\v4.0.30319\csc.exe

set-alias csc "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\MSBuild\Current\Bin\Roslyn\csc.exe"

# Install-Module -Name Recycle
set-alias rmt Remove-ItemSafely

function gitpullall(){
    cd ~/dkenv/runtime_config
    git pull
    cd ~/dkenv
    git pull
}

# gitpullall

function gitpushall(){
    cd ~/dkenv/runtime_config
    git add .
    git commit -m "."
    git push

    cd ~/dkenv
    git add .
    git commit -m "."
    git push
}

set-alias co code

set-alias iv iverilog
