.PHONY: yard solargraph rubocop

# note: may take awhile the first run
yard:
	@bash -c "bin/bundle exec yard gems"

solargraph: yard
	@bash -c "bin/solargraph typecheck --level=strict"

rubocop:
	@bash -c "bin/rubocop --autocorrect-all"

