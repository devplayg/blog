---
title: 'Git tips'
date: 2019-06-07T23:45:41+09:00
lastmod: 2019-06-11T23:45:41+09:00
categories: 
    - version control
    - tips
tags: 
    - git
type: posts
---

### To remove a submodule you need to:

- Delete the relevant section from the .gitmodules file.
- Stage the .gitmodules changes git add .gitmodules
- Delete the relevant section from .git/config.
- Run git rm --cached path_to_submodule (no trailing slash).
- Run rm -rf .git/modules/path_to_submodule (no trailing slash).
- Commit git commit -m "Removed submodule "
- Delete the now untracked submodule files rm -rf path_to_submodule

### Find and restore a deleted file in a Git repository
    
    git ls-files -d | xargs git checkout --


### Local branches

	git branch

### Remote branches

	git branch -r

### Sync branches with remote's it

	git fetch --all --prune
	git remote prune origin

### Delete the branch

	git branch -d <branch_name>

### Delete remote Branch

	git push origin --delete <branch_name>
	git push origin :<branch_name>

### Virtual run

	--dry-run

