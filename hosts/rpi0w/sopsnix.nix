# sops-nix: Decrypts and exposes sops secrets. Makes referencing them from the nixos config easy.
# The owner can access them at /run/secrets/$SECRET
{config, ...}: {
  config.sops = {
    defaultSopsFile = ./sops_secrets.yaml;
    age.keyFile = "/home/${config.userDefinedGlobalVariables.mainUsername}/.config/keys.txt";
    defaultSopsFormat = "yaml";
    secrets = {
      "restic/REPOSITORY" = {
        owner = config.userDefinedGlobalVariables.mainUsername;
      };
      "restic/PASSWORD" = {
        owner = config.userDefinedGlobalVariables.mainUsername;
      };
      ANTHROPIC_API_KEY = {
        owner = config.userDefinedGlobalVariables.mainUsername;
      };
      OPENAI_API_KEY = {
        owner = config.userDefinedGlobalVariables.mainUsername;
      };
      OPENROUTER_API_KEY = {
        owner = config.userDefinedGlobalVariables.mainUsername;
      };
      "git/USER_NAME" = {
        owner = config.userDefinedGlobalVariables.mainUsername;
      };
      "git/USER_EMAIL" = {
        owner = config.userDefinedGlobalVariables.mainUsername;
      };
    };
    templates."git_credentials" = {
      mode = "0600";
      owner = "${config.userDefinedGlobalVariables.mainUsername}";
      path = "/home/${config.userDefinedGlobalVariables.mainUsername}/.config/git/credentials";
      content = ''
        [user]
        email="${config.sops.placeholder."git/USER_NAME"}"
        name="${config.sops.placeholder."git/USER_EMAIL"}"
      '';
    };
  };
  # To do?: provide the secrets to systemd services
  # owner = "secretsService";
}
