# Optional helper for a Windows host you own or are authorized to administer.
# Review this script before running. It does not create public firewall rules,
# port-forward RDP, create accounts, or store credentials.

$ErrorActionPreference = "Stop"

Write-Host "Windows Cloud Gaming Host Preparation" -ForegroundColor Cyan
Write-Host "This script must run on the actual Windows host, not in GitHub Actions."
Write-Host ""

$edition = (Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion" -ErrorAction Stop).EditionID
Write-Host "Detected Windows edition: $edition"

if ($edition -match "Core") {
    Write-Warning "This appears to be Windows Home. It cannot host Microsoft's built-in Remote Desktop service."
    Write-Host "Use a supported Windows Pro/Enterprise edition or Windows Server, as permitted by your provider."
} else {
    Write-Host "If your edition supports Remote Desktop, you can enable it in Settings > System > Remote Desktop."
}

Write-Host ""
Write-Host "Next steps:"
Write-Host "1. Install Windows updates and restart if required."
Write-Host "2. Install Tailscale from https://tailscale.com/download/windows"
Write-Host "3. Sign in, then install Tailscale on your Android device and sign into the same tailnet."
Write-Host "4. Enable Remote Desktop only if supported and authorized."
Write-Host "5. Connect to the host's Tailscale IP from your remote desktop app."
Write-Host "6. Keep Windows Firewall enabled; do NOT expose TCP 3389 to the public internet."
Write-Host ""
Write-Host "No firewall rules, passwords, accounts, or public tunnels were changed by this script." -ForegroundColor Green
