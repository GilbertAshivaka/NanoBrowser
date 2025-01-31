#include "utils.h"

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtWebEngineQuick/qtwebenginequickglobal.h>

#include <QtQml/QQmlApplicationEngine>
#include <QtQml/QQmlContext>
#include <QtCore/QCommandLineParser>
#include <QtCore/QCommandLineOption>
#include <QtCore/QLoggingCategory>

static QUrl startupUrl()
{
    QUrl ret;
    QStringList args(qApp ->arguments());
    args.takeFirst();
    for (const QString &arg : qAsConst(args)){
        if(arg.startsWith(QLatin1Char('-')))
            continue;
        ret = MyUtils::fromUserInput(arg);
        if (ret.isValid())
            return ret;
    }

    return QUrl(QStringLiteral("chrome://qt"));
}


int main(int argc, char *argv[])
{
    QCoreApplication::setApplicationName("NanoBrowser");
    QCoreApplication::setOrganizationName("A1 Inc.");

    QtWebEngineQuick::initialize();
    QCoreApplication::setAttribute(Qt::AA_ShareOpenGLContexts);
    QGuiApplication app(argc, argv);

    qmlRegisterType<MyUtils>("MyUtils", 1, 0, "BrowserUtils");

    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/NanoBrowser/ApplicationRoot.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
        &app, []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    if (engine.rootObjects().isEmpty())
        qFatal("Failed to load sources");

    QMetaObject::invokeMethod(engine.rootObjects().constFirst(), "load", Q_ARG(QVariant, startupUrl()));

    return app.exec();
}
