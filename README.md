# MelonManager

WIP Flutter/Dart port of [Slaynash's MelonManager](https://github.com/Slaynash/MelonManager/) written in TypeScript minus the mods installation segment

Why you might ask? Its simple and easy to make nice looking apps with little effort. Flutter also lets you compile to several different platforms,
Heck you could probably get this to run on your ios device if you wanted to

You can find prebuilt releases for android/web/windows through github actions here

## Building
If you'd like to build this yourself you'll need to 
- Install flutter (^2.0.4)
- Install all Necessary C++ Build Tools, Windows 10 SDK etc. if you want to build for Windows
- Edit Your Flutter Config to enable windows building

Then you run can the flutter commands
- `flutter pub get`
- `flutter build windows` for windows
- `flutter build android` for android
- `flutter build web` for a web build
