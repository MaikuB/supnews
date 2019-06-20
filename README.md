# supnews

[![Codemagic build status](https://api.codemagic.io/apps/5cd97d9341300a1c8aa14062/5cd97d9341300a1c8aa14061/status_badge.svg)](https://codemagic.io/apps/5cd97d9341300a1c8aa14062/5cd97d9341300a1c8aa14061/latest_build)
<a href='https://play.google.com/store/apps/details?id=io.crossingthestreams.supnews&pcampaignid=MKT-Other-global-all-co-prtnr-py-PartBadge-Mar2515-1'><img alt='Get it on Google Play' src='https://play.google.com/intl/en_us/badges/images/generic/en_badge_web_generic.png' height='48px'/></a>

A simple Flutter app for displaying stories retrieved from Hacker News. Uses the [provider](https://github.com/rrousselGit/provider) package along with [MobX](https://mobx.pub) to managing the architecture

The app demonstrates

* Using MobX for managing UI state where stores function as view models that may talk to other services i.e. how to follow the widget -> store -> service structure
* Using `provider` organise stores and inject them into the appropriate widgets. Services are injected into the stores via `provider` as well. Both of these are done using the `Consumer` widget (and `Consumer2` when injecting in two dependencies)
* Using `provider` to resolve dependencies using the static `Provider.of<T>(context)` method
* How to load more items into a `ListView` based on scroll position by invoking an action in MobX
* Opening stories using the [url_launcher](https://github.com/flutter/plugins/tree/master/packages/url_launcher) package with the ability to load them in the browser instead of doing so "in-app"
* Toggling between dark and light theme
* Using custom fonts
* Using a Cupertino widgets within a material app

**NOTE**: when the app was originally written, the `ProxyProvider` class wasn't available yet in the `provider` package. It should be possible to update the app to make of use of it

When trying to debug on your machine via an Android device, you'll currently need to go to android/app/build.gradle and modify the contents to comment out/remove the store release related configuration. The latter configuration is there as I currently have this setup with [Codemagic](https://codemagic.io/) to deploy to the Google Play store. The relevant sections look like as follows

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

## Attributions
Google Play and the Google Play logo are trademarks of Google LLC.
