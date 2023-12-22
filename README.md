# Examples app of Flutter App Template

## Flutter app (path: apps/app)

### Flavor App ID
- dev: jp.co.meowthegreatest.{AppName}.dev
- stg: jp.co.meowthegreatest.{AppName}.stg
- prod: jp.co.meowthegreatest.{AppName}

### FlutterFire Configure
- requirement new Firebase service project (dev/stg/prod)
- command in apps/app\

```bash
firebase projects:list

# Dev
flutterfire configure --yes \
--project {Dev Project ID} \
--out lib/core/env/firebase_options_dev.dart \
--platforms android,ios,web \
--android-package-name jp.co.meowthegreatest.{AppName}.dev \
--ios-bundle-id jp.co.meowthegreatest.{AppName}.dev

# Stg
flutterfire configure --yes \
--project {Stg Project ID} \
--out lib/core/env/firebase_options_stg.dart \
--platforms android,ios,web \
--android-package-name jp.co.meowthegreatest.{AppName}.stg \
--ios-bundle-id jp.co.meowthegreatest.{AppName}.stg

# Prod
flutterfire configure --yes \
--project {Prod Project ID} \
--out lib/core/env/firebase_options_prod.dart \
--platforms android,ios,web \
--android-package-name jp.co.meowthegreatest.{AppName} \
--ios-bundle-id jp.co.meowthegreatest.{AppName}
```