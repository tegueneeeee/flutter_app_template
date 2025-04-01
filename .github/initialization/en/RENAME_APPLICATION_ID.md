## Overview

Steps to Rename Application ID in Flutter Project
Execute the script `/tools/rename-application-id.sh` to automatically perform the following steps:

Update JSON Files:

- Modify the application ID definitions in JSON files located in the `flavor` directory.

Update build.gradle:

- Change the `namespace` value in the `app` module’s `build.gradle` file to the new application ID.

Replace MainActivity.kt:

- Delete the old `MainActivity.kt` file.

- Generate a new `MainActivity.kt` file with the updated package name.

## Usage Instructions

To use this script, follow these steps:

Ensure Permissions:

- Verify that you have the necessary permissions to execute the script.

Run the Script with Arguments:

- Pass the new application IDs as arguments when executing the script:

Argument 1: Android Application ID

Argument 2: iOS Bundle ID

```sh
cd tools  
chmod +x rename-application-id.sh  # Set execute permission if needed.  
./rename-application-id.sh "com.example.android.rename" "com.example.ios.rename"  
```

## Reference

- [Configure the app module](https://developer.android.com/build/configure-app-module)
- [CFBundleIdentifier](https://developer.apple.com/documentation/bundleresources/information_property_list/cfbundleidentifier)
