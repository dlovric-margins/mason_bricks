# mason_example

# pubspec.yaml
Its important to have these moved inside dev_dependencies so build runner works
```
dev_dependencies:
  flutter_test:
    sdk: flutter
  freezed: ^2.4.6
  json_serializable: ^6.7.1
  build_runner: ^2.4.7
  flutter_lints: ^2.0.0
```

# analysis_options
```
analyzer:
  exclude: 
    - bricks/**
    - "**/*.g.dart"
    - "**/*.freezed.dart"
    - "**/*.mocks.dart"
```



# gitignore

```
*.g.dart
*.freezed.dart
.env
*.config.dart
*.gr.dart
```



# mason commands

mason make new_feature