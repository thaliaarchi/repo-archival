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
# Compensate for frequent force pushes
	git -C git/github.com/qeedquan/misc_utilities update-ref refs/heads/master origin/master
	git -C git/github.com/qeedquan/misc_utilities checkout master
