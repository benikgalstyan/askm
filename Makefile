g:
	make c
	make a
	make b
	make p
	make pod

b:
	fvm dart run build_runner build --delete-conflicting-outputs

a:
	fluttergen -c pubspec.yaml

p:
	fvm flutter pub get

c:
	fvm flutter clean

cg:
	fvm flutter clean
	fvm flutter pub

cr:
	fvm flutter pub cache repair

make icons:
	fvm dart run flutter_launcher_icons

make splash:
	fvm dart run flutter_native_splash:create
