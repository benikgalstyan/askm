(1) Upgrade build runner
```bash
$ flutter upgrade build_runner
```

(2) Install flutter_gen (https://pub.dev/packages/flutter_gen)
```bash
$ brew instal FlutterGen/tap/fluttergen
```

(3) Generate linked assets resources
```bash
$ dart pub global activate flutter_gen
```

(4) Generate annotations 
```bash
$ flutter packages pub run build_runner build
```

(5) Specify the patch to generate 
```bash
$ fluttergen -c pubspec.yaml
```

(6) Put away conflicting dependencies 
```bash
$ dart run build_runner build --delete-conflicting-outputs
```

(7) Generation for unsplash assets (https://pub.dev/packages/flutter_native_splash)
```bash
$ flutter pub run flutter_native_splash:create
```