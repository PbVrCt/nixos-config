# Create a repository to do the backups to
echo "Make sure to run this without sudo"
echo ""
mkdir -p ~/restic-repo
restic init --repo ~/restic-repo 
echo ""
echo "For automatic backups, give the restic config access to the repository password. See:
scripts/sops_add.nix - Add a secret
hosts/*/sopsnix.nix  - Expose it
/dotfiles/restic.nix  - Access it"
