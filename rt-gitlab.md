
#### 1. checkout new branch name `gitscg-dev`

```
git checkout -b gitscg-dev master
```

#### 2. add remote to newremote

```
## git remote add <remote_id> <git_repository_url>
git remote add <remote_id> http://user@gitlabhost/repository.git
```

#### 3. check new remote available

```
git remote -v
```

#### 4. fetch branch from remote

```
# git fetch <remote_branch> <remote_branch> 
git fetch <remote_branch> smldev 
```

#### 5. set upstream branch to remote `git branch --set-upstream-to=<remote_name>/<branch>`

```
# git branch --set-upstream-to=<remote_id>/<branch>
git branch --set-upstream-to=brgitlab/master
```

#### 6. Merge Source to new Remote

```
git merge origin/master <remote_id>/<branch> --allow-unrelated-histories
```