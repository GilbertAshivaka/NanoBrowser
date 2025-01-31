import QtQuick
import QtWebEngine

QtObject{
    id: root
    property QtObject defaultProfile: WebEngineProfile{
        storageName: "Profile"
        offTheRecord: false
    }

    property Component browserWindowComponent: BrowserWindow{
        applicationRoot: root
    }

    property QtObject otrProfile: WebEngineProfile{
        offTheRecord: true
    }

    property Component browserDialogComponent: BrowserDialog{
        onClosing: destroy()
    }

    function createWindow(profile){
        var newWindow = browserWindowComponent.createObject(root);
        newWindow.currentWebView.profile = profile;
        profile.downloadRequested.connect(newWindow.onDownloadRequested);
        return newWindow;
    }

    function createDialog(profile){
        var newDialog = browserDialogComponent.createObject(root);
        newDialog.currentWebView.profile = profile
    }

    function load(url){
        var browserWindow = createWindow(defaultProfile);
        browserWindow.currentWebView.url = url
    }
}
