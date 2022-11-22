# Gallery App - Flutter

A practice gallery app developed using Flutter.
<br/><br/><br/>
## Getting Started
Make sure you have installed and setup the Flutter SDK on your system.<br />
You can check it by running ```flutter doctor``` command on your terminal.
<br />
1. Clone this repository by running below command from command line.

```
git clone https://github.com/prabhatsdp/gallery_app_flutter.git
```
2. Navigate to project directory and run ```flutter pub get``` command in terminal.
3. Connect your physical device or emulator if not already connected.
4. Run below command to build and run the app on your device

```
flutter run --dart-define="API_KEY=YOUR_UNSPLASH_ACCESS_KEY"
```

## App Preview
<br />

<img src="https://media.giphy.com/media/LdjMPTINXAQk8Eu7Es/giphy.gif"/>
<br /><br />

## Libraries/Tools Used:

Libraries/Tools | Version | Used For | 
--- | --- | --- |
[Flutter](https://flutter.dev/) | 3.3.8  | To create and build a Flutter app obviously |
[dio](https://pub.dev/packages/dio) | ^4.0.6 | Network requests |
[bloc](https://pub.dev/packages/bloc) | ^8.1.0 | State management |
[flutter_bloc](https://pub.dev/packages/flutter_bloc) | ^8.1.1 | State management |
[logger](https://pub.dev/packages/logger) | ^1.1.0 | For better logging |
[get_it](https://pub.dev/packages/get_it) | ^7.2.0 | Dependency injection |
[injectable](https://pub.dev/packages/injectable) | ^1.5.0 | Dependency injection |
[equatable](https://pub.dev/packages/equatable) | ^2.0.3 | For improved equality comparisons |
[json_annotation](https://pub.dev/packages/json_annotation) | ^4.7.0 | For JSON to class generation |
[go_router](https://pub.dev/packages/go_router) | ^5.1.10 | For routing |
[auto_route](https://pub.dev/packages/auto_route) | ^3.2.0 | for routing |
[injectable_generator](https://pub.dev/packages/injectable_generator) | ^1.5.5 | For generating dependency injection classes |
[build_runner](https://pub.dev/packages/build_runner) | ^2.3.2 | For code generation |
[json_serializable](https://pub.dev/packages/json_serializable) | ^6.5.4 | For JSON to class generation |



A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
