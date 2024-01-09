# Mason bricks

## How to start?
``dart pub global activate mason_cli`` or ``brew tap felangel/mason && brew install mason``


## Currently available bricks:
- new_feature
- pubspec_setup

### new_feature
- defaults generation into current directory inside **/lib** folder

Optional structures\n
**with** state management
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
or **without** state management
```
new_feature
    presentation
        view
            new_feature_screen.dart
        widgets
```

### pubspec_setup
- defaults generation into current directory

Generates pubspec.yaml with these packages
```
dependencies
    cupertino_icons,
    retrofit,
    injectable,
    dio,
    freezed_annotation,
    injectable_generator,
    retrofit_generator,
    flutter_bloc,

dev_dependencies
    freezed,
    json_serializable,
    build_runner,
    flutter_lints,
```



## Add bricks

Entered desired repository (your project)

run in terminal ``mason init``

add mason files to .gitignore
```
/mason.yaml
/.mason
```

```
mason add new_feature --git-url https://github.com/dlovric-margins/mason_bricks --git-path bricks/new_feature
```
- "mason add" adds feature
- "new_feature" is the name of brick
- "--git-url" is the git url of directory containing bricks
- "--git-path" is the git path for specific brick




## Checking installed bricks
```mason ls -g``` will list global bricks that were added using "mason add -g"




## Using bricks
1. Enter the desired flutter project directory
2. Run in terminal ``mason make new_feature`` where **new_feature** is the brick we are using


## Updating bricks if new changes we pushed to github

Entered desired repository (your project)

run in terminal
1. ``mason cache clear``
2. ``mason get``

This will clear cache and get all bricks that are added to mason.yaml