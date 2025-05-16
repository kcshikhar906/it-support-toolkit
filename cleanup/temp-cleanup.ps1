# Removes temp files to free up space
Write-Host "Cleaning temp files..."

$paths = @(
    "$env:TEMP\*",
    "$env:WINDIR\Temp\*"
)

foreach ($path in $paths) {
    try {
        Remove-Item $path -Recurse -Force -ErrorAction SilentlyContinue
    } catch {
        Write-Host "Failed to delete: $path"
    }
}

Write-Host "Temp cleanup complete."
