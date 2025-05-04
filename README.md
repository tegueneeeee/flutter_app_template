## Get Started

### Advance preparation

- Install the [fvm].
- Install the [yq].

  ```shell
  git submodule update --init
  ```

  ```shell
  git submodule update --init
  ```

  ```shell
  fvm use --force
  FLUTTER_VERSION=$(cat .fvmrc | yq ".flutter" -r) && fvm global $FLUTTER_VERSION
  ```

  ```shell
  MELOS_VERSION=$(cat pubspec.lock | yq ".packages.melos.version" -r) && dart pub global activate melos $MELOS_VERSION
  ```

  ```shell
  MASON_VERSION=$(cat pubspec.lock | yq ".packages.mason_cli.version" -r) && dart pub global activate mason_cli $MASON_VERSION
  ```

  ```shell
  mason get
  ```

### Set up the IDEs to use fvm

reload the SDK by reloading the window.

### Copy env files

```shell
cp packages/shared/config/.env.example packages/shared/config/.env
cp packages/shared/config/.env.example packages/shared/config/.env.dev
cp packages/shared/config/.env.example packages/shared/config/.env.stg
```

### Install dependencies

```shell
melos bootstrap
```

### Generate codes

```shell
melos gen:all
```

### Run app

- `.vscode/launch.json`

<!-- Links -->

[fvm]: https://fvm.app/

[yq]: https://github.com/mikefarah/yq
