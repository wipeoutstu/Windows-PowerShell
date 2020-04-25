#PowerShell
Dir *.cb* | rename-item -newname { $_.name  -replace " GetComics.INFO","" }

Dir *.cbz | rename-item -newname { $_.name  -replace "cbz","zip" }

Dir *.rar | rename-item -newname { $_.name  -replace "rar","cbr" }

Dir *.mp3 | rename-item -newname { $_.name  -replace "-oma","" }

Dir *.mp4 | rename-item -newname { $_.name  -replace " [","" }

Dir *.mp4 | rename-item -newname { $_.name  -replace "\]",")" } #The backslash lets you change the [ character

Dir *.mkv | rename-item -newname { $_.name  -replace "\]",")" }


#CHANGE Filename to UPPERCASE
Get-ChildItem -Path "X:\Downloads\Babylon 5 Complete\Season 5" -Filter *.mkv | % {Rename-Item $_.FullName -NewName ([string]$_.Name).ToUpper()}


#If Filename is in uppercase, you have to conmvert it to lowercase first, before you change it to TitleCase

#CHANGE Filename to lowercase
Get-ChildItem -Path "X:\Downloads\Babylon 5 Complete\Season 5" -Filter *.mkv | % {Rename-Item $_.FullName -NewName ([string]$_.Name).ToLower()}

#CHANGE Filename to Title Case
$text = [System.Threading.Thread]::CurrentThread.CurrentCulture.TextInfo
Get-ChildItem -Path "M:\Stu\Soundtracks\Smokey & The Bandit 3" -Filter *.mp3 | Rename-Item -NewName { "$($text.ToTitleCase($_.BaseName))$($_.Extension)" }
