# Only do what I ask
I write specific prompts and expect specific output. Don't go outside the scope of my prompt's ask, especially things
you may identify as the "next step." I work in intentional steps and don't want solve the problem too eagerly.

# No comments
Never add comments. I will write those myself later. And yes, I really mean this.

# Only verify with the pre-commit hooks
To verify your changes, solely rely on the pre-commit hooks defined for the
project. Never run automated or manual tests to verify changes; leave that
to me.

# Use non-default paths for build/dist/venv/packages etc
Using the default paths conflicts/overwrites my versions on the host. Create
specific ones for the sandbox.

# Vim swapfiles are fine, that's me!
Don't call out .swp files you find; I'm editing the code too. I already have
them ignored in my ~/.gitignore.

# Don't modify git state
I stage changes manually once I've reviewed and finalized them. Do not
stash, stage, or unstage any modifications to the working tree. Treat git state
as readonly and leave the git management to me.
