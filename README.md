# Examples app of Flutter App Template

## Flutter app (path: apps/app)

### Flavor App ID
- dev: jp.co.{OrganizationName}.{AppName}.dev
- stg: jp.co.{OrganizationName}.{AppName}.stg
- prod: jp.co.{OrganizationName}.{AppName}

Change App ID
build.gradle (apps/app/android/app)
```bash
namespace "jp.co.{OrganizationName}.{AppName}"
```
project.pbxproj
```bash
PRODUCT_BUNDLE_IDENTIFIER = "jp.co.{OrganizationName}.{AppName}"
```

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
--android-package-name jp.co.{OrganizationName}.{AppName}.dev \
--ios-bundle-id jp.co.{OrganizationName}.{AppName}.dev

mkdir ios/dev
mv ios/firebase_app_id_file.json ios/dev
mv ios/Runner/GoogleService-Info.plist ios/dev
mv android/app/google-services.json android/app/src/dev

# Stg
flutterfire configure --yes \
--project {Stg Project ID} \
--out lib/core/env/firebase_options_stg.dart \
--platforms android,ios,web \
--android-package-name jp.co.{OrganizationName}.{AppName}.stg \
--ios-bundle-id jp.co.{OrganizationName}.{AppName}.stg

# Prod
flutterfire configure --yes \
--project {Prod Project ID} \
--out lib/core/env/firebase_options_prod.dart \
--platforms android,ios,web \
--android-package-name jp.co.{OrganizationName}.{AppName} \
--ios-bundle-id jp.co.{OrganizationName}.{AppName}
```
