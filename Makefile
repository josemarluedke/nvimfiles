.PHONY: install
install:
	@echo "Installing Bundles\n"
	@nvim -c PlugInstall -c q -c q -u bundles.vim
	@echo "*******************************************************************"
	@echo "All done!"
	@echo "Be sure to checkout the helpful links in the README"
	@echo "GitHub: https://github.com/josemarluedke/nvimfiles"
	@echo "*******************************************************************"

.PHONY: update
update:
	@echo "Updating to latest and greatest..\n"
	@(which git-up > /dev/null && git-up) || git pull origin master
	@echo "Updating Bundles\n"
	@nvim  -c PlugClean! -c PlugUpgrade -c PlugUpdate
	@echo "*******************************************************************"
	@echo "Finished"
	@echo "*******************************************************************"
