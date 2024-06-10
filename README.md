(1) Upgrade build runner
```bash
$ flutter upgrade build_runner
```
(2) Generate assets
```bash
$ dart run build_runner build
```

(5) Put away conflicting dependencies 
```bash
$ dart run build_runner build --delete-conflicting-outputs
```

(6) Generation for unsplash assets (https://pub.dev/packages/flutter_native_splash)
```bash
$ flutter pub run flutter_native_splash:create
```
