# gifter_club_mobile

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

### OAuth Redirect Configuration (Android/iOS)

To enable Google OAuth to return to your mobile app, set a deep-link redirect URL in your `.env`:

```dotenv
SUPABASE_REDIRECT_URL=myapp://login-callback
```

And register the corresponding scheme in Android (`android/app/src/main/AndroidManifest.xml`):
```xml
<intent-filter>
  <action android:name="android.intent.action.VIEW" />
  <category android:name="android.intent.category.DEFAULT" />
  <category android:name="android.intent.category.BROWSABLE" />
  <data android:scheme="myapp" android:host="login-callback" />
</intent-filter>
```

On iOS, configure the same URL scheme in `Info.plist` accordingly.

#### Supabase Dashboard & Google OAuth Settings

1. **Supabase Auth settings** (Dashboard → Auth → Settings → Redirect URLs):
   - Add your deep-link URI (`myapp://login-callback`) to the **Redirect URLs** list.
   - Ensure your mobile redirect is listed _after_ any web/HTTP URLs.

2. **Google Cloud OAuth client** (APIs & Services → Credentials):
   - Under **Authorized redirect URIs**, add your deep-link (`myapp://login-callback`).
   - Save and wait a few minutes for the changes to propagate.
