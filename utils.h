#ifndef UTILS_H
#define UTILS_H

#include <QtQml/qqml.h>
#include <QtCore/QFileInfo>
#include <QtCore/QUrl>

class MyUtils : public QObject
{
    Q_OBJECT
    QML_ELEMENT
    QML_SINGLETON

public:
    Q_INVOKABLE static QUrl fromUserInput(const QString &userInput);
};

#endif // UTILS_H
