{pkgs, lib, ...}:
{
  programs.vscode = {
    enable = true;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      dracula-theme.theme-dracula
      yzhang.markdown-all-in-one
      bbenoist.nix
    ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
	    {
	    	name = "vscript-snippets";
	    	publisher = "Baptiste-Martinet";
	    	version = "1.0.4";
	    	sha256 = "jZ/h9nXaCz8cHcKKKFW6aevx6QdftfqBXungQ3CjwhU=";
	    }
	    {
	    	name = "vscript-debug";
	    	publisher = "LionDoge";
	    	version = "0.2.7";
	    	sha256 = "CXmSRIK+00bN0ONLuLeIgIMYeM3tqBJ7R6JhveIhv00=";
	    }
	    {
	    	name = "vscode-electricimp";
	    	publisher = "electricimp";
	    	version = "1.0.0";
	    	sha256 = "a23AfdrJTCQYj7vJCDYwdxe7MvoTfH8bGVjB92ktp7w=";
	    }
	    {
	    	name = "better-comments";
	    	publisher = "aaron-bond";
	    	version = "3.0.2";
	    	sha256 = "hQmA8PWjf2Nd60v5EAuqqD8LIEu7slrNs8luc3ePgZc=";
	    }
	    {
	    	name = "remote-ssh";
	    	publisher = "ms-vscode-remote";
	    	version = "0.121.2025071515";
	    	sha256 = "x++DaNxQ80ZQwRNDiWpO9Ygwc5YJeg4lEPcl7Z/DkpI=";
	    }
		{
			name = "catppuccin-vsc";
			publisher = "Catppuccin";
			version = "3.17.0";
			sha256 = "sha256-udDbsXAEsJUt3WUU8aBvCi8Pu+8gu+xQkimlmvRZ9pg=";
		}
    ];

    profiles.default.userSettings = {
      "files.autoSave" = "afterDelay";

	  "workbench.iconTheme" = "catppuccin-mocha";
	  
	  "editor.selectionClipboard" = false;
	  
	  "merge-conflict.autoNavigateNextConflict.enabled" = true;
	  
	  "git.autofetch" = true;
	  "git.openRepositoryInParentFolders" = "always";
	  
	  "VScriptDebugger.displayRootTable" = true;
	  
    };
  };

  home.file.".config/Code/User/snippets" = {
	source = ./code-snippets;
	recursive = true;
  };
}
