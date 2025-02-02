# Power Consumption Analytics

**Power Consumption Analytics** is a real-time IoT-based energy management system designed to monitor and optimize energy usage. By combining smart meters, cloud computing with **ThingSpeak**, and a mobile app developed with **Flutter**, this system offers an intuitive solution for efficient energy management, providing users with insights into their power consumption, detecting anomalies, and optimizing energy usage.

### Key Features
- **Real-time Power Monitoring**: Track voltage, power factor, and consumption trends.
- **Anomaly Detection**: Instant alerts for overvoltage or low power factor deviations.
- **Cloud Integration**: Data storage and processing on **ThingSpeak** cloud platform.
- **User Interface**: A dynamic Flutter-based mobile app that visualizes data and provides real-time analytics.
- **Scalability**: Supports growing numbers of devices and users, ideal for both small and large-scale applications.

### System Overview
The architecture consists of three key layers:
1. **Input Layer**: IoT smart meters measuring key electrical parameters.
2. **Processing Layer**: ThingSpeak for cloud-based data processing and analytics.
3. **Output Layer**: A user-friendly mobile interface built with **Flutter** to display real-time data, alerts, and consumption reports.

---

### Getting Started

To set up and run the system, follow these steps:

#### Prerequisites
- **ThingSpeak Account**: Sign up for an account on [ThingSpeak](https://thingspeak.com).
- **Flutter SDK**: Install Flutter from [Flutter's official site](https://flutter.dev).
- **Smart Meters**: IoT devices with Wi-Fi or Zigbee support to transmit data.

#### Installation Steps:
1. **Clone the repository**:
    ```bash
    git clone https://github.com/rprakashdass/power_consumption_analytics.git
    cd power_consumption_analytics
    ```

2. **Set up ThingSpeak**:
    - Create a new channel on ThingSpeak and generate API keys.

3. **Configure IoT devices** to transmit data to ThingSpeak via REST APIs.

4. **Build and run the Flutter app**:
    ```bash
    flutter run
    ```

5. **Monitor and optimize energy usage** using the real-time dashboards and alerts in the app.

---

### Team Members
- **Muthuraja M** - [GitHub](https://github.com/muthuraja05980)
- **Krishnan T** - [GitHub](https://github.com/Krishnan17022005)
- **Prakash Dass R** - [GitHub](https://github.com/rprakashdass)
- **Deepak Kumaran RMG** - [GitHub](https://github.com/deepakkumaran032004)
- **Bharath G** - [GitHub](https://github.com/bharathking2394)

---

### License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
