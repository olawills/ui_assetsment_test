# Welcome to UI Assetment Test

<p>A Two Page UI built with Flutter </p>

Uses Flutter Bloc, Geolocator package and Permission Handler to make the Design look more dynamic

The Project used Flutter Bloc as the state management solution to manage, control and optimize the location and map function

## App Build can be found at
- apk/app-arm64.apk (for android 10)
- apk/app-realearmeabi-v7a.apk (for android 11 and above)
- apk/app-x86_64-release.apk (for android 8-9 below)
- https://drive.google.com/drive/folders/1eqkG4_jdu-YkU2yUbQU1t405PDb2demy?usp=sharing


Features
- A two Page UI
- Map and Boking Feature
- Location Tracking

### State Management

Bloc is used as the state management solution for the map, location and gps access, this choice was because of my familiarity and very good use of Bloc for small to large project

## Folder Structure

```
lib
├───bloc (All Blocs are Handle here)
│   
|
│ 
└───constants
    ├───dimensions (contains app size file)
    ├───extensions (conatins extensions such as spacing e.g sbh for SizedBox(height: height))
    ├───helpers (contains custom markers for the map)
|
|
└───models
│         
└───Ui (Contains Three screen, splash, page one and page two)
|    
|
|
|
└───Widgets (Contains custom reusable classes, components such as buttons)
|
└─── main.dart

```


A new Flutter project.
