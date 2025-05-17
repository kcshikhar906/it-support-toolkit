# ping-test.ps1
# Tests connectivity to essential network targets

$targets = @(
    "8.8.8.8",        # Google DNS
    "1.1.1.1",        # Cloudflare DNS
    "google.com",     # Internet test
    "localhost",      # Localhost test
    "192.168.1.1"     # Default gateway (adjust if needed)
)

Write-Host "Running network diagnostics..." -ForegroundColor Cyan

foreach ($target in $targets) {
    Write-Host "Pinging $target..." -NoNewline

    $ping = Test-Connection -ComputerName $target -Count 2 -Quiet

    if ($ping) {
        Write-Host " ✅ Success" -ForegroundColor Green
    } else {
        Write-Host " ❌ Failed" -ForegroundColor Red
    }
}

Write-Host "`nDiagnostics complete." -ForegroundColor Cyan
