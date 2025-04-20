param(
    # Path to the project file; adjust this default value if needed.  
    [string]$ProjectFilePath = "",
    [string]$Organisation = ""
    )

function ExitWaitForKey {
    param(
        [string]$ErrorMessage = ""
    )

    if ($ErrorMessage) {
        Write-Error $ErrorMessage
    }

    Write-Host "Press any key to continue..."
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

    exit 1
}

if ($ProjectFilePath -eq "") {
    # If no path is provided, use the default path to the project file.

    # Get child path of the script root directory
    $ChildPath = Split-Path -Path $PSScriptRoot -Leaf
    if ($organisation -eq "") {
        # If no organisation is provided, use the script second last directory name as the organisation.
        $organisation = ($PSScriptRoot.Split('\\'))[-2]
    }
    $ChildPath = $ChildPath.Split('.')[-1]
    $ProjectFilePath = Join-Path -Path "$PSScriptRoot" -ChildPath "src"

    $ProjectFilePath = Join-Path -Path "$ProjectFilePath" -ChildPath $ChildPath
    $ProjectFilePath = Join-Path -Path "$ProjectFilePath" -ChildPath "$organisation.$ChildPath.csproj" 
    ExitWaitForKey -ErrorMessage "No project file path provided. Using default path: $ProjectFilePath"
}

# Verify the project file exists.
if (!(Test-Path $ProjectFilePath)) {
    ExitWaitForKey -ErrorMessage "Project file does not exist at path: $ProjectFilePath"
}

# Load the project file as XML.
try {
    [xml]$projXml = Get-Content $ProjectFilePath -ErrorAction Stop
} catch {
    ExitWaitForKey -ErrorMessage "Failed to load the project file. Ensure the file exists and is accessible."
}

# Find the first PropertyGroup element that contains a VersionPrefix element.
$propertyGroup = $projXml.Project.PropertyGroup | Where-Object { $_.VersionPrefix }
if (-not $propertyGroup) {
    ExitWaitForKey -ErrorMessage "No <VersionPrefix> element found in the project file."
}

# Get the old version string.
$oldVersion = $propertyGroup.VersionPrefix
Write-Output "Current version: $oldVersion"

# Validate and increment the version.
$versionParts = $oldVersion -split "\."
if ($versionParts.Length -ne 3 -or -not ($versionParts | ForEach-Object { $_ -match '^\d+$' })) {
    ExitWaitForKey -ErrorMessage "Version format is not recognized. Expected format: Major.Minor.Build (e.g., 0.1.0)"
}

$major = $versionParts[0]
$minor = $versionParts[1]
$build = [int]$versionParts[2]
$build++

$newVersion = "$major.$minor.$build"
$propertyGroup.VersionPrefix = $newVersion
Write-Output "Updated version: $newVersion"

# Save the updated project file.
try {
    $projXml.Save($ProjectFilePath)
    Write-Output "Project file updated with new version."
} catch {
    ExitWaitForKey -ErrorMessage "Failed to save the updated project file."
}

# Commit and push the changes using Git.
try {
    Write-Output "Staging changes..."
    & git add $ProjectFilePath

    Write-Output "Creating commit..."
    & git commit -m "Bump build number to $newVersion"
} catch {
    ExitWaitForKey -ErrorMessage "Failed to commit changes to the repository."
}

Start-Sleep -Seconds 3
