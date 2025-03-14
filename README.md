# NanoBrowser

A minimal browser based on Chromium, made using Qt/QML and a bit of C++.

## Overview

NanoBrowser is a lightweight, minimalist web browser built on top of the Chromium engine. It aims to provide a clean and simplified browsing experience while leveraging the rendering capabilities of Chromium and the UI flexibility of Qt/QML.

## Features

- Minimalist interface with essential browsing controls
- Chromium-based rendering engine for modern web compatibility
- Cross-platform support
- Download manager
- Search functionality
- Full-screen notification support
- Web authentication dialog

## Technology Stack

- **Frontend**: Qt Quick/QML (93.0%)
- **Backend**: C++ (3.9%)
- **Build System**: CMake (3.1%)
- **Rendering Engine**: Chromium

## Project Structure

- `assets/` - Application resources
- `ApplicationRoot.qml` - Main application entry point
- `BrowserDialog.qml` - Browser dialog implementations
- `BrowserWindow.qml` - Main browser window implementation
- `DownloadView.qml` - Download manager interface
- `FindBar.qml` - Search functionality
- `FullScreenNotification.qml` - Full-screen mode notifications
- `Main.qml` - Main QML file
- `WebAuthDialog.qml` - Authentication dialog for websites
- `main.cpp` - C++ entry point
- `utils.cpp/h` - Utility functions

## Prerequisites

- Qt 6 or higher
- CMake 3.15 or higher
- C++ compiler with C++17 support
- Chromium Embedded Framework (CEF) or QtWebEngine

## Building the Application

1. Clone the repository:
   ```
   git clone https://github.com/GilbertAshivaka/NanoBrowser.git
   ```

2. Navigate to the project directory:
   ```
   cd NanoBrowser
   ```

3. Create a build directory:
   ```
   mkdir build && cd build
   ```

4. Configure with CMake:
   ```
   cmake ..
   ```

5. Build the project:
   ```
   cmake --build .
   ```

## Usage

1. Launch NanoBrowser from the build directory
2. Use the address bar to navigate to websites
3. Access browser settings through the menu
4. Use keyboard shortcuts for common actions:
   - Ctrl+T: New tab
   - Ctrl+W: Close tab
   - Ctrl+L: Focus address bar
   - Ctrl+F: Find in page

This was a fun project to build, made me learn how browsers work at the intermidiate layer.

## Contributing

Contributions to NanoBrowser are welcome! Please feel free to submit a Pull Request or open an Issue to discuss potential improvements or report bugs.


## Contact

Gilbert Ashivaka - [GitHub Profile](https://github.com/GilbertAshivaka)

Project Link: [https://github.com/GilbertAshivaka/NanoBrowser](https://github.com/GilbertAshivaka/NanoBrowser)
