# Weather App

A **Weather App** built using Flutter, providing users with current weather conditions, a 3-day forecast, and a history of previous searches. This app integrates with the Visual Crossing Weather API and uses `Provider` for state management.

---

## Features

1. **Search for Weather**:
   - Enter a city name to fetch current weather conditions and past day forecast.

2. **Toggle Temperature Unit**:
   - Switch between Celsius (Metric) and Fahrenheit (Imperial).

3. **Search History**:
   - View previously searched cities and their respective weather data.
   - Stored locally using `shared_preferences`.

4. **State Management**:
   - Efficient state handling using the `Provider` package.

---

## Installation

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/NehilKoshiya/weatherapp.git
   cd weather-app
   ```

2. **Install Dependencies**:
   ```bash
   flutter pub get
   ```

3. **Run the App**:
   ```bash
   flutter run
   ```

---

## Dependencies

- **Flutter**: SDK for building cross-platform apps.
- **Provider**: State management.
- **http**: For API requests.
- **shared_preferences**: Local storage.

Install these dependencies by running:
```bash
flutter pub add provider http shared_preferences
```

---

## API Integration

The app uses the [Visual Crossing Weather API](https://www.visualcrossing.com/) to fetch weather data. Ensure you have an API key:

1. Sign up on the [Visual Crossing](https://www.visualcrossing.com/) website.
2. Replace the placeholder API key in `weather_provider.dart`:
   ```dart
   final apiKey = 'YOUR_API_KEY';
   ```

---


## Contributing

Contributions are welcome! Follow these steps:

1. Fork the repository.
2. Create a feature branch.
3. Commit your changes.
4. Open a pull request.

---

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---



Happy coding!
