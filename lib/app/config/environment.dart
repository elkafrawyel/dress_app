class Environment {
  static const AppMode appMode = AppMode.testing;

  static url2() {
    switch (appMode) {
      case AppMode.testing:
      case AppMode.staging:
        return 'https://gramdahab.com/api/';
      case AppMode.live:
        return 'https://gramdahab.com/api/';
    }
  }


  static url() {
    switch (appMode) {
      case AppMode.testing:
      case AppMode.staging:
        return 'https://demo.gramdahab.com:3377/';
      case AppMode.live:
        return 'https://demo.gramdahab.com:3377/';
    }
  }
}

enum AppMode {
  testing,
  staging,
  live,
}
