function Get-LicecapPath () {
	$path = ""
	# Check for 64-bit Windows (this env variable only exists in 64-bit)
	if (Test-Path "Env:\ProgramFiles(x86)") {
		$path = "${env:ProgramFiles(x86)}\LICEcap\Uninstall.exe"
	}
	else {
		$path = "$env:programfiles\LICEcap\Uninstall.exe"
	}
	
	if (Test-Path $path -PathType Leaf) {
		return $path
	}
	else {
		throw [System.IO.FileNotFoundException] "Uninstaller not found at this location: $path"
	}
}

Start-Process $(Get-LicecapPath) -ArgumentList "/S" -Wait

# Manually remove start menu folder because the installer doesn't do so
Remove-Item "$Env:ProgramData\Microsoft\Windows\Start Menu\Programs\LICEcap" -Recurse