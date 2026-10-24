# Windows Cloud Gaming Starter (GitHub + RDP)

This repository is a **setup starter kit**, not a free cloud PC by itself.

## Important limitations

- GitHub repositories store code; GitHub Actions runners are temporary CI machines, not permanent gaming PCs.
- This project does **not** create an RDP tunnel from a GitHub Actions runner or expose a public RDP port.
- For gaming, you need a Windows host with a GPU and enough RAM/CPU. Free cloud services generally do not provide reliable, persistent GPU gaming machines.
- Windows Home cannot act as a built-in Microsoft Remote Desktop host. Use a supported Windows Pro/Enterprise edition or Windows Server, subject to the host provider's terms.
- RDP is useful for administration but can be poor for real-time gaming. If supported by your host, use a game-streaming solution for play and RDP for maintenance.

## Recommended architecture

1. Create a Windows VM on a provider that explicitly permits remote desktop and gaming.
2. Install Windows updates and your game launcher/game using legitimate licenses.
3. Install Tailscale on the Windows host and on your Android device, then sign both into the same private tailnet.
4. Enable Remote Desktop on the Windows host only if your Windows edition supports it.
5. Connect to the host's **Tailscale IP** using Microsoft Remote Desktop or Windows App on Android.
6. Keep Windows Firewall enabled. Do not port-forward TCP 3389 to the public internet.

## Files

- `scripts/Prepare-WindowsHost.ps1`: optional host preparation helper. Run locally on your own Windows host in an elevated PowerShell window. Review it first.
- `.github/workflows/check.yml`: validates repository basics only. It does not provision a PC or run RDP.
- `docs/SECURITY.md`: security notes.

## Quick start

1. Create a new GitHub repository and upload these files.
2. On your own supported Windows host, open PowerShell **as Administrator**.
3. Review `scripts/Prepare-WindowsHost.ps1`, then run:
   ```powershell
   Set-ExecutionPolicy -Scope Process RemoteSigned
   .\scripts\Prepare-WindowsHost.ps1
   ```
4. Install Tailscale on both host and phone from the official site/app store and sign into the same account.
5. Follow the script's printed checklist. Confirm your provider allows RDP and gaming.

## Free option reality check

You can host the *repository* on GitHub for free. A persistent Windows gaming VM with a GPU is generally not available at zero cost. Avoid tutorials that ask you to paste cloud credentials, tunnel tokens, or passwords into a public repository or GitHub Actions logs.
