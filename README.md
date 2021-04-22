# MelonManager

WIP Flutter/Dart port of [Slaynash's MelonManager](https://github.com/Slaynash/MelonManager/) written in TypeScript minus the mods installation segment.
This isn't meant to replace Slaynash's MelonManager. I decided it would be a nice project to do as a learning opportunity for flutter. 
Why Flutter you might ask? Its simple and easy to make nice looking apps with little effort. Flutter also lets you compile to several different platforms,
Heck you could probably get this to run on your ios device if you wanted to

You can find prebuilt releases for android/web/windows through github actions here

> Note: Not api.vrcmg.com has restrictions when it comes to cors and this affects the web build as seen [here](https://melonmanagerdemo.glitch.me)

> Don't go looking for support in the MelonLoader discord. Github issues are a thing that exist
 
## Building
If you'd like to build this yourself you'll need to 
- Install flutter (^2.0.4)
- Install all Necessary Dependencies for the platform you want to build for. See [here](https://flutter.dev/desktop#requirements) for desktop requirements
- Edit Your Flutter Config to if needed to allow for building for your target platform

Then you run can the flutter commands
- `flutter pub get`
- `flutter build windows` for windows
- `flutter build android` for android
- `flutter build web` for a web build
