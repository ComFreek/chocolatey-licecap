$packageName = 'LICEcap'
$installerType = 'EXE'
$url = 'http://www.cockos.com/licecap/licecap125-install.exe'
$silentArgs = '/S'
$validExitCodes = @(0)

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" -validExitCodes $validExitCodes