.PHONY: install
install:
	@echo "Installing Packer\n"
	@nvim -u ./init.lua --headless +'autocmd User PackerComplete sleep 100m | qall' +PackerInstall
	@nvim -u ./init.lua --headless +'autocmd User PackerComplete sleep 100m | qall' +PackerSync
	@echo "*******************************************************************"
	@echo "All done!"
	@echo "Be sure to checkout the helpful links in the README"
	@echo "GitHub: https://github.com/josemarluedke/nvimfiles"
	@echo "*******************************************************************"

.PHONY: update
update:
	@echo "Updating to latest and greatest..\n"
	@(which git-up > /dev/null && git-up) || git pull origin main
	@echo "Updating Packer\n"
	@nvim -u ./init.lua --headless +'autocmd User PackerComplete sleep 100m | qall' +PackerInstall
	@nvim -u ./init.lua --headless +'autocmd User PackerComplete sleep 100m | qall' +PackerSync
	@echo "*******************************************************************"
	@echo "Finished"
	@echo "*******************************************************************"
