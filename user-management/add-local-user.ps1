# add-local-user.ps1
# Creates a new local user account

# Prompt for username and password
$username = Read-Host "Enter the new username"
$password = Read-Host "Enter the password" -AsSecureString

# Create the user
Try {
    New-LocalUser -Name $username -Password $password -FullName $username -Description "Created by IT Support Toolkit"
    Write-Host "✅ User '$username' created successfully." -ForegroundColor Green
}
Catch {
    Write-Host "❌ Failed to create user: $_" -ForegroundColor Red
}

# Ask if the user should be added to Administrators
$addToAdmins = Read-Host "Add to Administrators group? (Y/N)"
if ($addToAdmins -eq "Y") {
    try {
        Add-LocalGroupMember -Group "Administrators" -Member $username
        Write-Host "✅ User added to Administrators group." -ForegroundColor Green
    } catch {
        Write-Host "❌ Failed to add user to group: $_" -ForegroundColor Red
    }
}
