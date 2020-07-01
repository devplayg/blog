---
title: 'Git tips'
date: 2019-06-07T23:45:41+09:00
lastmod: 2020-02-02T23:45:41+09:00
categories: 
    - version control
    - tips
tags: 
    - git
    - tag
    - branch
    - version
type: posts
---

### Adding submodules

    git clone git@github.com:YOUR_GIT_ID/parent.git
    
    cd parent
    git submodule add git@github.com:YOUR_GIT_ID/child.git child
    git commit -m "submodule is added."
    git push
    
### Updating submodule on parent

    git submodule init
    git submodule update

### Global account

    $ git config --global user.name "devplayg"
    $ git config --global user.email "devplayg@gmail.com" 

### Local account

    $ git config --local user.name "devplayg"
    $ git config --local user.email "devplayg@example.com 

### Find and restore a deleted file in a Git repository

Find     

    git ls-files -d 

Restore

    git checkout <filename>

Find & restore
    
    git ls-files -d | xargs git checkout --
    

### Branch

Clone branch

    git clone -b <branch> <repo> [<dir>]
    git clone -b test_branch https://github.com/devplayg/himma
    git clone -b test_branch https://github.com/devplayg/himma himma_branch
    
List local branches

	git branch

List Remote branches

	git branch -r

Sync branches with remote's it

	git fetch --all --prune
	git remote prune origin

Delete branch

	git branch -d <branch_name>

Delete remote Branch

	git push origin --delete <branch_name>
	git push origin :<branch_name>

Virtual run

	--dry-run

To remove a submodule you need to:

- Delete the relevant section from the .gitmodules file.
- Stage the .gitmodules changes git add .gitmodules
- Delete the relevant section from .git/config.
- Run git rm --cached path_to_submodule (no trailing slash).
- Run rm -rf .git/modules/path_to_submodule (no trailing slash).
- Commit git commit -m "Removed submodule "
- Delete the now untracked submodule files rm -rf path_to_submodule
