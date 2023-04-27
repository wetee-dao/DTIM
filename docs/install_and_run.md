# DAO-entrance phase 1 - Milestone 2/3
> NOTE Window flutter_rust_bridge config is not ready

This repository is for the submission of milestone 3 of the Web 3 Foundation Grant

### Rust Setup
- [Linux development environment](https://docs.substrate.io/install/linux/).
- [MacOS development environment](https://docs.substrate.io/install/linux/).
- [Windows development environment](https://docs.substrate.io/install/linux/).

### Flutter Setup
- [Linux development environment](https://docs.flutter.dev/get-started/install/linux/).
- [MacOS development environment](https://docs.flutter.dev/get-started/install/macos/).
- [Windows development environment](https://docs.flutter.dev/get-started/install/windows/).

### Run matrix Server（Not necessary, because the project is a slightly modified matrix official server）
- [Install golang](https://go.dev/doc/install)
- Run Node
    ```
    $ git clone https://github.com/dao-entrance/org-node
    $ cd org-node
    $ ./build.sh

    # Generate a Matrix signing key for federation (required)
    $ ./bin/generate-keys --private-key matrix_key.pem

    # Generate a self-signed certificate (optional, but a valid TLS certificate is normally
    # needed for Matrix federation/clients to work properly!)
    $ ./bin/generate-keys --tls-cert server.crt --tls-key server.key

    # Copy and modify the config file - you'll need to set a server name and paths to the keys
    # at the very least, along with setting up the database connection strings.
    $ cp dendrite-sample.yaml dendrite.yaml

    # Build and run the server:
    $ ./bin/dendrite --tls-cert server.crt --tls-key server.key --config dendrite.yaml

    # Create an user account (add -admin for an admin user).
    # Specify the localpart only, e.g. 'alice' for '@alice:domain.com'
    $ ./bin/create-account --config dendrite.yaml --username alice

    $ ./bin/dendrite-monolith-server --tls-cert server.crt --tls-key server.key --config dendrite.yaml
    ```

### RUN client
> please uninstalling Flutter Snap and installing it manually,It is best to install version 3.7.3
- run environment
    ```
    $ rustup update
    $ rustup default nighty
    $ flutter config --enable-macos-desktop
    $ flutter config --enable-linux-desktop
    $ flutter config --enable-windows-desktop
    $ apt-get install clang cmake ninja-build pkg-config libgtk-3-dev liblzma-dev
    $ apt install libsecret-1-dev libjsoncpp-dev  libolm3 libclang-dev  libayatana-appindicator3-dev
    $ cargo install flutter_rust_bridge_codegen
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