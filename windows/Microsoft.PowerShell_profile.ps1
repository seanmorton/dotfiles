########################################
# Env
########################################
$Env:EDITOR = "vim"
$Env:PATH += ';C:\Sean Morton\bin'

########################################
# Prompt
########################################
function Get-GitBranch {
    $branch = git branch --show-current 2>$null
    if ($LASTEXITCODE -eq 0 -and $branch) { return " $branch" }
    return ""
}
function prompt {
    $esc     = [char]27
    $magenta = "$esc[35m"
    $cyan    = "$esc[36m"
    $reset   = "$esc[0m"

    $dir    = Split-Path -Leaf (Get-Location)
    $time   = Get-Date -Format "HH:mm:ss"
    $branch = Get-GitBranch

    # Right-align the branch name (mirrors zsh RPROMPT):
    # save cursor → jump to right column → print branch → restore cursor
    if ($branch) {
        $col = $Host.UI.RawUI.WindowSize.Width - $branch.Length + 1
        Write-Host -NoNewline "${esc}[s${esc}[${col}G${branch}${esc}[u"
    }

    "${magenta}[${reset}${dir}${magenta}|${reset}${time}${magenta}]${reset} ${cyan}`$${reset} "
}

########################################
# Shell Features
########################################
Import-Module PSReadLine
Set-PSReadLineOption -BellStyle None
Set-PSReadLineOption -EditMode Vi
Set-PSReadLineOption -HistoryNoDuplicates
Set-PSReadLineOption -HistorySavePath "$HOME\.ps_history"
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineOption -MaximumHistoryCount 50000
Set-PSReadLineKeyHandler -Chord "Ctrl+r" -Function ReverseSearchHistory

# Requires PSFzf — install with: Install-Module PSFzf
# Ctrl+T (file search), Ctrl+R (history), Alt+C (cd into dir)
if (Get-Module -ListAvailable -Name PSFzf -ErrorAction SilentlyContinue) {
    Import-Module PSFzf
    Set-PsFzfOption -PSReadlineChordProvider      'Ctrl+t'
    Set-PsFzfOption -PSReadlineChordReverseHistory 'Ctrl+r'
} else {
    Write-Host "PSFzf not found — run: Install-Module PSFzf" -ForegroundColor Yellow
}

########################################
# Aliases and commands
########################################
function g { git @args }
function wow { git status }

function k { kubectl @args }
function pods {
    while ($true) {
        Clear-Host
        kubectl get pods
        Start-Sleep -Seconds 1
    }
}
if (Get-Command kubectl -ErrorAction SilentlyContinue) {
    kubectl completion powershell | Out-String | Invoke-Expression
}

function tf { terraform @args }
