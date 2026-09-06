# Boost CLI installer for Windows.
# Usage:
#   irm https://raw.githubusercontent.com/jfrog/boost/main/install.ps1 | iex
#   .\install.ps1
#
# Environment:
#   BOOST_INSTALL_FROM  - local .zip path, release tag (e.g. v1.2.3), or "latest" (default)
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

$Tmp = Join-Path ([System.IO.Path]::GetTempPath()) ("boost-install-" + [guid]::NewGuid().ToString())
New-Item -ItemType Directory -Force -Path $Tmp | Out-Null
try {
    $ExePath = Join-Path $Tmp 'boost.exe'

    if (Test-Path -LiteralPath $From) {
        Write-Host "→ Installing from local archive: $From"
        Expand-Archive -LiteralPath $From -DestinationPath $Tmp -Force
        if (-not (Test-Path -LiteralPath $ExePath)) {
            throw "archive missing 'boost.exe' binary"
        }
    } else {
        if (-not (Get-Command curl.exe -ErrorAction SilentlyContinue)) {
            throw 'curl.exe is required for remote installs (included with Windows 10 1803+)'
        }

        $Tag = $From
        if ($From -eq 'latest') {
            # Mirror install.sh: curl -fsSLI … -w '%{url_effective}' on releases/latest.
            $tagUrl = & curl.exe -fsSLI -o NUL -w '%{url_effective}' "https://github.com/$Repo/releases/latest"
            if ($LASTEXITCODE -ne 0 -or -not $tagUrl) {
                throw 'could not resolve latest release tag'
            }
            $Tag = ($tagUrl -split '/tag/')[-1]
            if (-not $Tag) {
                throw 'could not resolve latest release tag'
            }
        }

        $Archive = 'boost-windows-amd64.zip'
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

    New-Item -ItemType Directory -Force -Path $InstallDir | Out-Null
    Copy-Item -LiteralPath $ExePath -Destination (Join-Path $InstallDir 'boost.exe') -Force
    $version = & (Join-Path $InstallDir 'boost.exe') version 2>$null
    if (-not $version) { $version = 'unknown' }
    Write-Host "→ Installed: $version to $(Join-Path $InstallDir 'boost.exe')"

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
    Write-Host 'You can start by running:'
    Write-Host '   boost init'
} finally {
    Remove-Item -LiteralPath $Tmp -Recurse -Force -ErrorAction SilentlyContinue
}
