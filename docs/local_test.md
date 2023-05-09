### Initialize the local test environment

- Step1 run chain in docker
    ```
    $ docker run -d -p 3994:9944  wetee/dao-entrance-node:dev.2023-04-25-21_41 
    ```

- Step2 init DAO DATA 
    ```
    $ flutter run hacks/init_dao.dart

    $ sh hack/init_linux.sh
    ```

- Step3 run e2e Test 
  > During this process, the script will send enough TOKENs for testing to the new account.
  ```
  flutter test integration_test/dao_test.dart
  ``` 