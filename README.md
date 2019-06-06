# supnews

A simple Flutter app for displaying stories retrieved from Hacker News. Uses the [provider](https://github.com/rrousselGit/provider) package along with [MobX](https://mobx.pub) to managing the architecture

The app demonstrates

* Using MobX for managing UI state where stores function as view models that may talk to other services i.e. how to follow the widget -> store -> service structure
* Using `provider` organise stores and inject them into the appropriate widgets. Services are injected into the stores via `provider` as well. Both of these are done using the `Consumer` widget (and `Consumer2` when injecting in two dependencies)
* Using `provider` to resolve dependencies using the static `Provider.of<T>(context)` method
* How to load more items into a `ListView` based on scroll position by invoking an action in MobX
* Opening stories using the [url_launcher](https://github.com/flutter/plugins/tree/master/packages/url_launcher) package with the ability to load them in the browser instead of doing so "in-app"
* Toggling between dark and light mode
* Using custom fonts
* Using a Cupertino widgets within a material app

When trying to debug on your machine via an Android device, you'll currently need to go to android/app/build.gradle and modify the contents to comment out/remove the store release related configuration. The relevant sections look like as follows

```
// beginning of config for store release
signingConfigs {
    release {
        keyAlias keystoreProperties['keyAlias']
        keyPassword keystoreProperties['keyPassword']
        storeFile file(keystoreProperties['storeFile'])
        storePassword keystoreProperties['storePassword']
    }
}

buildTypes {
    release {
        signingConfig signingConfigs.release
        minifyEnabled true
        useProguard true
        proguardFiles getDefaultProguardFile('proguard-android.txt'), 'proguard-rules.pro'
    }
}
// end of config related to store release

// for debugging
/*buildTypes {
    release {
        // TODO: Add your own signing config for the release build.
        // Signing with the debug keys for now, so `flutter run --release` works.
        signingConfig signingConfigs.debug
    }
}*/
```

After modifying it so it can be debugged, it'll look like as follows

```
// beginning of config for store release
/*signingConfigs {
    release {
        keyAlias keystoreProperties['keyAlias']
        keyPassword keystoreProperties['keyPassword']
        storeFile file(keystoreProperties['storeFile'])
        storePassword keystoreProperties['storePassword']
    }
}

buildTypes {
    release {
        signingConfig signingConfigs.release
        minifyEnabled true
        useProguard true
        proguardFiles getDefaultProguardFile('proguard-android.txt'), 'proguard-rules.pro'
    }
}*/
// end of config related to store release

// for debugging
buildTypes {
    release {
        // TODO: Add your own signing config for the release build.
        // Signing with the debug keys for now, so `flutter run --release` works.
        signingConfig signingConfigs.debug
    }
}
```