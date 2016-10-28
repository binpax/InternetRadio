#include <QGuiApplication>
//#include "units.h"
//#include <QtQuick>
#include <QQmlContext>
#include <QQmlApplicationEngine>
#include "qml-material/src/plugin.h"
#include <QList>
#include <QString>
#include <QObject>
#include <QMediaPlayer>
#if defined(Q_OS_ANDROID)
#include "javaclient.h"
#endif
#include <iostream>

class Channel : public QObject
{
    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)
    Q_PROPERTY(QString source READ source WRITE setsource NOTIFY sourceChanged)
    Q_PROPERTY(QString imageSource READ imageSource WRITE setimageSource NOTIFY imageSourceChanged)
public:
    Channel(QString,QString,QString);

    QString name;
    QString source;
    QString imageSource;
};
Channel::Channel(QString name, QString source,QString imageSource){
    this->name = name;
    this->source = source;
    this->imageSource = imageSource;
}

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;
    QQmlContext *context = engine.rootContext();
    engine.addImportPath(":/.");
    MaterialPlugin qmlMaterial;
    qmlMaterial.registerTypes("Material");
    //QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    //QQuickView view;
    //view.setResizeMode(QQuickView::SizeRootObjectToView);
    //view.setSource(Qsource(QStringLiteral("qrc:/main.qml")));
    //NotificationClient *notificationClient = new NotificationClient(&engine);

    //QList<QObject*> dataList;
    //dataList.append(new Channel("Hitradio","http://hitradio-maroc.ice.infomaniak.ch/hitradio-maroc-128.mp3", "qrc:/srcRadios/Radios/hit-radio.png"));
    //dataList.append(new Channel("Medi 1","http://media.yabiladi.com:8000", "qrc:/srcRadios/Radios/medi-1-radio.jpg"));
    //context->setContextProperty("myModel", QVariant::fromValue(dataList));
   // context->setContextProperty(QLatin1String("dpvalue"),calcdpi());

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    QObject *qmlMediaPlayer;
    //QMediaPlayer *player = qvariant_cast<QMediaPlayer *>(qmlMediaPlayer->property("StreamPlayer"));

    //bool var = player->isMuted();

    return app.exec();
}
