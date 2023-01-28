{
  description = "A very basic flake";

  outputs = { self, nixpkgs }: {

    nixosModules."<name>" = { config }: { options = {}; config = {}; };
  # Default module
  nixosModules.default = {};

  };
}
