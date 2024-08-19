# make deploy
deploy:
	nix build .#darwinConfigurations.sengoku.system --extra-experimental-features 'nix-command flakes'

	./result/sw/bin/darwin-rebuild switch --flake .#sengoku