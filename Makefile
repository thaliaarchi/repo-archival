format_gitmodules:
	@perl -0ne 'print sort split(/^(?=\S)/m)' .gitmodules | sponge .gitmodules

# Clone all submodules
.PHONY: init_submodules
init_submodules:
	git submodule update --init --jobs 5

# Update all submodules to latest remote head
.PHONY: update_submodules
update_submodules:
	git submodule update --remote --jobs 5
