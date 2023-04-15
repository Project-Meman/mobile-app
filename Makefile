runner:
	@flutter pub run build_runner watch --delete-conflicting-outputs

generator:
	@fluttergen -c pubspec.yaml

clean:
	@flutter clean && rm ios/Podfile.lock pubspec.lock && rm -rf ios/Pods ios/Runner.xcworkspace

build-prod:
	@flutter clean && flutter build appbundle --release

build-staging:
	@flutter clean && flutter build apk
