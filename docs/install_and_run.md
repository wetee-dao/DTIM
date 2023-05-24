# DAO-entrance phase 1 - Milestone 2/3
> NOTE Window flutter_rust_bridge config is not ready

This repository is for the submission of milestone 3 of the Web 3 Foundation Grant

### Rust Setup 
- [Linux development environment](https://docs.substrate.io/install/linux/).
- [MacOS development environment](https://docs.substrate.io/install/macos/).
- [Windows development environment](https://docs.substrate.io/install/windows/).

### Rust precompile lib
- window run "sh hacks/init_windows.sh"
- mac run "sh hacks/init_mac.sh"
- linux run "sh hacks/init_linux.sh"  
  > Subsequently, if a glibc error occurs, please run "sh hacks/precompile_linux.sh"  

### Flutter Setup
- [Linux development environment](https://docs.flutter.dev/get-started/install/linux/).
- [MacOS development environment](https://docs.flutter.dev/get-started/install/macos/).
- [Windows development environment](https://docs.flutter.dev/get-started/install/windows/).

### RUN client
> please uninstalling Flutter Snap and installing it manually,It is best to install version 3.7.3
- run environment
    ```
    $ rustup update
    $ rustup default nighty
    $ flutter config --enable-macos-desktop
    $ flutter config --enable-linux-desktop
    $ flutter config --enable-windows-desktop

    # for linux
    $ apt-get install clang cmake ninja-build pkg-config libgtk-3-dev liblzma-dev
    $ apt install libsecret-1-dev libjsoncpp-dev  libolm3 libclang-dev  libayatana-appindicator3-dev
    $ apt install libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev
    ```
- run in macos/linux
    ```
    $ flutter run -d linux
    OR
    $ flutter run -d macos
    ```

### RUN E2E CHAT
```
flutter test integration_test/chat_test.dart
```

### RUN E2E DAO
```
flutter test integration_test/dao_test.dart
```