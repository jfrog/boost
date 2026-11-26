# Boost CLI installer for Windows.
# Usage:
#   irm https://raw.githubusercontent.com/jfrog/boost/main/install.ps1 | iex
#   .\install.ps1
#
# Environment:
#   BOOST_INSTALL_FROM  - local .zip path, directory with boost.exe, release tag, or "latest" (default)
#   BOOST_INSTALL_DIR   - install directory (default: %LOCALAPPDATA%\boost\bin)

$ErrorActionPreference = 'Stop'

$Repo = 'jfrog/boost'
$From = if ($env:BOOST_INSTALL_FROM) { $env:BOOST_INSTALL_FROM } else { 'latest' }
$InstallDir = if ($env:BOOST_INSTALL_DIR) {
    $env:BOOST_INSTALL_DIR
} elseif ($env:LOCALAPPDATA) {
    Join-Path $env:LOCALAPPDATA 'boost\bin'
} else {
    Join-Path $env:USERPROFILE 'AppData\Local\boost\bin'
}

function Write-Banner {
    Write-Host ''
    Write-Host '        ███  ███' -ForegroundColor Green
    Write-Host '        █ █  █ █' -ForegroundColor Green
    Write-Host '       ██████████▬▬▬  Happy Boosting!' -ForegroundColor Green
    Write-Host '        ██    ██' -ForegroundColor Green
    Write-Host ''
}

function Clear-InternetDownloadBlock {
    param([Parameter(Mandatory)][string]$LiteralPath)
    if (Get-Command Unblock-File -ErrorAction SilentlyContinue) {
        Unblock-File -LiteralPath $LiteralPath -ErrorAction SilentlyContinue | Out-Null
    }
}

function Get-BoostInstalledVersion {
    param([Parameter(Mandatory)][string]$Exe)
    $prev = $ErrorActionPreference
    $ErrorActionPreference = 'SilentlyContinue'
    try {
        $out = & $Exe version 2>$null
        if ($out) { return [string]$out }
    } catch {
        # Best-effort probe only; copy + PATH update must still succeed.
    } finally {
        $ErrorActionPreference = $prev
    }
    return 'unknown'
}

$Tmp = Join-Path ([System.IO.Path]::GetTempPath()) ("boost-install-" + [guid]::NewGuid().ToString())
New-Item -ItemType Directory -Force -Path $Tmp | Out-Null
try {
    $ExePath = Join-Path $Tmp 'boost.exe'

    if (Test-Path -LiteralPath $From) {
        $fromItem = Get-Item -LiteralPath $From
        if ($fromItem.PSIsContainer) {
            Write-Host "→ Installing from local directory: $From"
            $srcExe = Join-Path $From 'boost.exe'
            if (-not (Test-Path -LiteralPath $srcExe)) {
                throw "directory missing 'boost.exe' binary"
            }
            Copy-Item -LiteralPath $srcExe -Destination $ExePath -Force
        } else {
            Write-Host "→ Installing from local archive: $From"
            Expand-Archive -LiteralPath $From -DestinationPath $Tmp -Force
            if (-not (Test-Path -LiteralPath $ExePath)) {
                throw "archive missing 'boost.exe' binary"
            }
        }
    } else {
        if (-not (Get-Command curl.exe -ErrorAction SilentlyContinue)) {
            throw 'curl.exe is required for remote installs (included with Windows 10 1803+)'
        }

        $Archive = 'boost-windows-amd64.zip'
        $Tag = $From
        if ($From -eq 'latest') {
            $tagUrl = & curl.exe -fsSLI -o NUL -w '%{url_effective}' "https://github.com/$Repo/releases/latest"
            if ($LASTEXITCODE -ne 0 -or -not $tagUrl) {
                throw 'could not resolve latest release tag'
            }
            $Tag = ($tagUrl -split '/tag/')[-1]
            if (-not $Tag) {
                throw 'could not resolve latest release tag'
            }
        }

        $GithubUrl = "https://github.com/$Repo/releases/download/$Tag/$Archive"
        Write-Host "→ Downloading $Archive ($Tag)"
        $ZipPath = Join-Path $Tmp $Archive
        # Show curl's progress bar on interactive terminals; stay silent in CI/pipes.
        $curlArgs = @('-fL', $GithubUrl, '-o', $ZipPath)
        if (-not $env:CI -and [Environment]::UserInteractive) {
            $curlArgs = @('--progress-bar') + $curlArgs
        } else {
            $curlArgs = @('-sS') + $curlArgs
        }
        & curl.exe @curlArgs
        if ($LASTEXITCODE -ne 0) {
            throw "download failed: $GithubUrl"
        }
        Expand-Archive -LiteralPath $ZipPath -DestinationPath $Tmp -Force
        if (-not (Test-Path -LiteralPath $ExePath)) {
            throw "archive missing 'boost.exe' binary"
        }
        Write-Host "→ Downloaded successfully from GitHub releases ($GithubUrl)"
    }

    if (-not (Test-Path -LiteralPath $ExePath)) {
        throw 'download failed: binary not found'
    }

    Clear-InternetDownloadBlock -LiteralPath $ExePath
    New-Item -ItemType Directory -Force -Path $InstallDir | Out-Null
    $DestExe = Join-Path $InstallDir 'boost.exe'
    Copy-Item -LiteralPath $ExePath -Destination $DestExe -Force
    Clear-InternetDownloadBlock -LiteralPath $DestExe
    $version = Get-BoostInstalledVersion -Exe $DestExe
    Write-Host "→ Installed: $version to $DestExe"

    $userPathParts = ([Environment]::GetEnvironmentVariable('Path', 'User') -split ';' | Where-Object { $_ -ne '' })
    if ($userPathParts -notcontains $InstallDir) {
        [Environment]::SetEnvironmentVariable('Path', [Environment]::GetEnvironmentVariable('Path', 'User') + ";$InstallDir", 'User')
        Write-Host "→ Added $InstallDir to user PATH"
    }
    $pathParts = ($env:PATH -split ';' | Where-Object { $_ -ne '' })
    if ($pathParts -notcontains $InstallDir) {
        $env:PATH = "$InstallDir;$env:PATH"
    }

    Write-Banner
    Write-Host '→ Boost is installed!'
    Write-Host ''
    # BOOST_INVITE: a friend's Boost Pro invite code (from their share message).
    if ($env:BOOST_INVITE) {
        & (Join-Path $InstallDir 'boost.exe') pro redeem $env:BOOST_INVITE
        if ($LASTEXITCODE -ne 0) { Write-Warning "Invite not applied. Retry later with: boost pro redeem $env:BOOST_INVITE" }
        Write-Host ''
    }
    Write-Host 'You can start by running:'
    Write-Host '   boost init'
} finally {
    Remove-Item -LiteralPath $Tmp -Recurse -Force -ErrorAction SilentlyContinue
}
