SwiftfulCrypto 🚀
Modern, scalable, and reactive cryptocurrency tracking iOS application built with SwiftUI and the MVVM architecture.

Tech Stack & Architecture
Architecture: Model-View-ViewModel (MVVM) design pattern ensuring clear separation of concerns.

UI Framework: Declarative user interfaces built completely with SwiftUI.

Reactive Programming: Combine framework utilized for managing data streams, API networking subscribers, and data binding.

Networking & Data: Custom data services (CoinDataService, CoinDetailDataService) integrating with the CoinGecko API.

Core Features
Real-Time Market Data: Live tracking of cryptocurrency prices, market caps, total volumes, and 24-hour percentage changes.

Interactive Charting: Custom-drawn, animated sparkline charts (ChartView) utilizing Swift's Path and GeometryReader with dynamic color gradients based on price action.

Detailed Coin Analysis: Comprehensive view featuring overview statistics, additional blockchain metrics (such as hashing algorithms and block times), and expandable description sections with raw HTML content cleanup.

Robust Custom Extensions: Tailored Swift extensions for Date formatting, String sanitization (HTML occurrence removal), and numeric formatting (currency conversions and abbreviation scaling).

