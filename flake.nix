{
  description = "BaseLayer-AI aarch64-darwin llama.cpp local environment wrapper";

  inputs = { nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/*"; };

  outputs = { self, nixpkgs } :
    let pkgs = import nixpkgs { system = "aarch64-darwin"; };
    in { 

      packages.aarch64-darwin.default = pkgs.writeTextFile { name = "run"; executable = true; destination = "/bin/run";
        text = ''#!${pkgs.stdenv.shell}
nix run nixpkgs#llama-cpp -- cli --version
      '';};

      packages.aarch64-darwin.gemma-4-12B-it-GGUF = pkgs.writeTextFile { name = "run"; executable = true; destination = "/bin/run";
        text = ''#!${pkgs.stdenv.shell}
nix run nixpkgs#llama-cpp -- cli -hf ggml-org/gemma-4-12B-it-GGUF:Q8_0
      '';};

    };
}
