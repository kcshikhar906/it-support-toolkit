# launch-toolkit.ps1
# Simple GUI to launch IT Support Toolkit scripts

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Create Form
$form = New-Object System.Windows.Forms.Form
$form.Text = "IT Support Toolkit"
$form.Size = New-Object System.Drawing.Size(400, 300)
$form.StartPosition = "CenterScreen"

# Define button style
$btnStyle = @{
    Width = 300
    Height = 40
    Left = 50
}

# Function to run scripts
function Run-Script {
    param([string]$scriptPath)
    Start-Process powershell -ArgumentList "-ExecutionPolicy Bypass -NoExit -File `"$scriptPath`""
}

# Add Buttons
$cleanupBtn = New-Object System.Windows.Forms.Button
$cleanupBtn.Text = "🧹 Temp File Cleanup"
$cleanupBtn.Top = 30
$cleanupBtn.Add_Click({ Run-Script ".\cleanup\temp-cleanup.ps1" })

$pingBtn = New-Object System.Windows.Forms.Button
$pingBtn.Text = "🌐 Network Ping Test"
$pingBtn.Top = 80
$pingBtn.Add_Click({ Run-Script ".\networking\ping-test.ps1" })

$userBtn = New-Object System.Windows.Forms.Button
$userBtn.Text = "👤 Add Local User"
$userBtn.Top = 130
$userBtn.Add_Click({ Run-Script ".\user-management\add-local-user.ps1" })

$sysInfoBtn = New-Object System.Windows.Forms.Button
$sysInfoBtn.Text = "🧠 Check System Info"
$sysInfoBtn.Top = 180
$sysInfoBtn.Add_Click({ Run-Script ".\system-info\check-system-info.ps1" })

$form.Controls.Add($sysInfoBtn)


# Add to form
$form.Controls.AddRange(@($cleanupBtn, $pingBtn, $userBtn))
$form.Controls | ForEach-Object {
    $_.Width = $btnStyle.Width
    $_.Height = $btnStyle.Height
    $_.Left = $btnStyle.Left
}

# Show form
[void]$form.ShowDialog()
