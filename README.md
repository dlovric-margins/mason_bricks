# Mason bricks

## How to start?
```
dart pub global activate mason_cli
```
or
```
brew tap felangel/mason && brew install mason
```
\
\

## Currently available bricks:
- new_feature
- pubspec_setup

**new_feature** defaults generation into current directory inside **/lib** folder with this structure

with **state_management**
```
new_feature
    core
        entities
        models
        new_feature_repo.dart
        new_feature_source.dart
    presentation
        logic
            new_feature_cubit
                new_feature_cubit.dart
                new_feature_state.dart
        view
            new_feature_screen.dart
        widgets
```
or without **state_management**
```
new_feature
    presentation
        view
            new_feature_screen.dart
        widgets
```

**pubspec_setup** defaults generation into current directory

\
\

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
\
\
## Checking installed bricks
```mason ls -g``` will list global bricks that were added using "mason add -g"
\
\
## Using bricks
Enter the desired flutter project directory
Run in terminal ``mason make new_feature`` where **new_feature** is the brick we are using
