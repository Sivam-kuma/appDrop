🌟 AppDrop – Dynamic UI Builder (Flutter)

AppDrop is a Flutter application that builds complete screens dynamically from JSON.
No hard-coded UI — every banner, carousel, grid, text widget, or video player is generated based on JSON components.

This project is perfect for:

Dynamic Mobile Landing Pages

CMS-driven app

🚀 Features

✅ 1. Dynamic UI Rendering

AppDrop reads a JSON file and converts every component into UI widgets:

Banner

Carousel (auto-play)

Grid gallery

Text blocks

Video player

Footer section

Just update JSON → UI updates automatically without changing code.

✅ 2. Supports Multiple Component Types

Each component is mapped to a model and widget:

JSON Type	Flutter Widget
banner	BannerWidget
text	TextWidget
carousel	CarouselWidget
grid	GridWidget
video	VideoWidget

✅ 3. Clean Architecture with Provider

Provider is used for:

Loading JSON

Parsing models

Reactive UI updates

This keeps logic separate from UI.

✅ 4. Mobile-Friendly & Responsive

Works on:

Android Emulator

Physical Devices

✔ Why Provider?

Lightweight

Simple dependency injection

Reactive data

Easy to scale

Perfect for JSON-driven apps.

⚙️ How Dynamic UI Works

AppDrop reads JSON like:

{
  "type": "carousel",
  "images": [...],
  "height": 220,
  "autoPlay": true
}


🔹 UIProvider loads JSON
🔹 Based on "type", it selects the correct model
🔹 A factory maps the model → widget
🔹 Flutter builds the complete UI dynamically



🛠 Tech Stack

Flutter

Dart

Provider (State Management)

Video Player Plugin

Lazy-loading images

🧪 How to Run the Project
1️⃣ Clone the repository
git clone https://github.com/Sivam-kuma/appDrop.git
cd AppDrop

2️⃣ Install dependencies
flutter pub get

3️⃣ Run the Application
flutter run

4️⃣ Build Release APK
flutter build apk --release


APK will be found at:

build/app/outputs/flutter-apk/app-release.apk

