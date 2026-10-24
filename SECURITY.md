# Security checklist

- Never publish passwords, private keys, API tokens, Tailscale auth keys, or cloud-provider credentials.
- Do not run an RDP tunnel from GitHub Actions to make a temporary runner look like a permanent PC.
- Do not open TCP 3389 to the public internet. Prefer a private network such as Tailscale or a provider VPN.
- Use a unique, strong password and MFA on your cloud-provider and Tailscale accounts.
- Keep Windows updated and use a non-administrator account for everyday use where practical.
- Check the cloud provider's terms before installing game launchers or running games.
- A repository's GitHub Actions workflow is not a Windows GPU host. The included workflow only checks that files exist.
