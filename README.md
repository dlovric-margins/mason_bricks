# Mason bricks

## How to start?
```
dart pub global activate mason_cli
```
or
```
brew tap felangel/mason && brew install mason
```




## Currently available bricks:
- new_feature
- pubspec_setup


## Add bricks globaly
Adding bricks to global mason to avoid **mason init** in every project
```
mason add -g new_feature --git-url https://github.com/dlovric-margins/mason_bricks --git-path bricks/new_feature
```
- "mason add" adds feature
- "-g" global mason cache
- "new_feature" is the name of brick
- "--git-url" is the git url of directory containing bricks
- "--git-path" is the git path for specific brick


## Checking installed bricks
```mason ls -g``` will list global bricks that were added using "mason add -g"


## Using bricks
Enter the desired flutter project directory
Run in terminal ``mason make new_feature`` where **new_feature** is the brick we are using
