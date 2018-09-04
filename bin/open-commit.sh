REPO=$(basename `git rev-parse --show-toplevel`)
open "https://github.com/$REPO/commit/$1"
