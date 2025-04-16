
# Haupcar Assessment - Flutter Git Demo

This is a sample Flutter mobile application for the Haupcar coding assessment. The project demonstrates the ability to build a functional app using Flutter, BLoC, RESTful API, and localization support.

## Features

- Home page: Display a list of product categories.
- Product page: Show products under a selected category.
- Localization support (English, Thai, Myanmar) using Drawer menu.
- BLoC pattern used for state management.
- Responsive UI with Material Design.
- RESTful API integration with [dummyjson](https://dummyjson.com/).

## Demo Video
[Watch the demo video here](https://github.com/shwe-sd/shwe_haupcar_assessment/demo_video.MP4)


## Getting Started

1. Clone this repository
```bash
git clone https://github.com/shwe-sd/shwe_haupcar_assessment.git
cd shwe_haupcar_assessment
```

2. Install dependencies
```bash
flutter pub get
```

3. Install localization
```bash
flutter gen-l10n
```

4. Run the app
```bash
flutter run
```

## REST API

- Categories: `https://dummyjson.com/products/categories`
- Products by category: `https://dummyjson.com/products/category/{category}`

## Language Support

- Change language from Drawer menu
- App supports English and Thai for UI labels (not API data)

## Folder Structure

```
lib/
├── blocs/             # BLoC for categories, products, and locale
├── core/              # Themes and constants
├── presentation/      # UI Screens
├── widgets/           # Custom drawer, widgets
├── main.dart          # Entry point
```

## Development Notes

- Project created step by step with individual commits to show progress clearly.
- BLoC used for all async state management.
- Localization generated using `flutter gen-l10n`.

## APK

[You can test the release APK file here](https://github.com/shwe-sd/shwe_haupcar_assessment/blob/main/shwe_haupcar_assessment.apk)

## Submission

- GitHub Repo: [https://github.com/shwe-sd/shwe_haupcar_assessment](https://github.com/shwe-sd/shwe_haupcar_assessment)
- APK included in repository for direct installation.

---

✅ Task completed by: **Shwe**  
📧 Contact: thearise.sps@gmail.com
