
- checkout new branch name `brsml`

```
git checkout -b brsml master
```

- add remote to http://user@sc.boonrawd.co.th/dev_team/SinghaSML-vs.git

```
git remote add brgitlab http://user@sc.boonrawd.co.th/dev_team/SinghaSML-vs.git
```

check new remote available

```
git remote -v
```

- fetch branch from remote

```
git fetch brgitlab
```

- set upstream branch to remote `git branch --set-upstream-to=<remote_name>/<branch>`

```
git branch --set-upstream-to=brgitlab/master
```

- Merge Source to new Remote

```
git merge origin/master github/master --allow-unrelated-histories
```
