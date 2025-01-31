cmake_minimum_required(VERSION 3.16)

project(NanoBrowser VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick)
find_package(Qt6 6.4 REQUIRED COMPONENTS WebEngineQuick WebView Core Gui Qml)

qt_standard_project_setup()

qt_add_executable(appNanoBrowser
    main.cpp
    utils.h
    utils.cpp
)

qt_add_qml_module(appNanoBrowser
    URI NanoBrowser
    VERSION 1.0
    QML_FILES BrowserWindow.qml
    RESOURCES assets/backArrow.png assets/nextArrow.png
    RESOURCES assets/refresh.png assets/stop.png
    QML_FILES ApplicationRoot.qml
    QML_FILES BrowserDialog.qml
    QML_FILES DownloadView.qml
    QML_FILES FindBar.qml
    QML_FILES FullScreenNotification.qml
    QML_FILES WebAuthDialog.qml
    SOURCES utils.h
    SOURCES utils.cpp
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appNanoBrowser PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appNanoBrowser
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appNanoBrowser
    PRIVATE Qt6::Quick
    PRIVATE Qt6::WebEngineQuick
    PRIVATE Qt6::WebView
    PRIVATE Qt6::Core
    PRIVATE Qt6::Gui
    PRIVATE Qt6::Qml
)

include(GNUInstallDirs)
install(TARGETS appNanoBrowser
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
