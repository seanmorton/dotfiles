# Limit comments
Don't leave comments that are too detailed and specific to just the current change-set. Document what's there, not the diff.
Reserve comments for things that are truly notable for future contributors that aren't already apparent from the code itself.

# Only verify with build, typechecker and lint
Never run manual tests against the app / database or automated tests; leave that to me. Only verify with the code with build, typechecker and lint.

# Use non-default paths for build/dist/venv/packages etc
Using the default paths conflicts/overwrites my versions on the host. Create specific ones for the sandbox.

# Vim swapfiles are fine, that's me!
Don't call out .swp files you find. I'm editing the code too. I already have them ignored in my ~/.gitignore.
