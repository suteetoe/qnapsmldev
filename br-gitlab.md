
1. checkout new branch name `brsml`

```
git checkout -b brsml master
```

2. add remote to http://user@sc.boonrawd.co.th/dev_team/SinghaSML-vs.git

```
git remote add brgitlab http://user@sc.boonrawd.co.th/dev_team/SinghaSML-vs.git
```

3. check new remote available

```
git remote -v
```

4. fetch branch from remote

```
git fetch brgitlab
```

5. set upstream branch to remote `git branch --set-upstream-to=<remote_name>/<branch>`

```
git branch --set-upstream-to=brgitlab/master
```

6. Merge Source to new Remote

```
git merge origin/master github/master --allow-unrelated-histories
```
