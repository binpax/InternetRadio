
#include "javaclient.h"


NotificationClient::NotificationClient(QObject *parent)
    : QObject(parent)
{
    connect(this, SIGNAL(notificationChanged()), this, SLOT(updateAndroidNotification()));
}

void NotificationClient::setNotification(const QString &notification)
{
    if (m_notification == notification)
        return;

    m_notification = notification;
    emit notificationChanged();
}

QString NotificationClient::notification() const
{
    return m_notification;
}

void NotificationClient::updateAndroidNotification()
{

#if defined(Q_OS_ANDROID)

    QAndroidJniObject javaNotification = QAndroidJniObject::fromString(m_notification);
    QAndroidJniObject::callStaticMethod<void>("org/ahmed/radios/notification/NotificationClient",
                                       "notify",
                                       "(Ljava/lang/String;)V",
                                       javaNotification.object<jstring>());
    qDebug()<<"dddddddddddddddddddddddd";

#endif
}
#if defined(Q_OS_ANDROID)

int calcdpi(){
    static QAndroidJniEnvironment env;

    QAndroidJniObject activity = QtAndroid::androidActivity();
    QAndroidJniObject resources =
            activity.callObjectMethod("getResources", "()Landroid/content/res/Resources;");
    if (env->ExceptionCheck()) {
        env->ExceptionDescribe();
        env->ExceptionClear();
        return 2;
    }

    QAndroidJniObject displayMetrics =
            resources.callObjectMethod("getDisplayMetrics", "()Landroid/util/DisplayMetrics;");
    if (env->ExceptionCheck()) {
        env->ExceptionDescribe();
        env->ExceptionClear();

        return 2;
    }
    return displayMetrics.getField<float>("density");
}
#endif
