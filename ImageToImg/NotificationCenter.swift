import Foundation

class NotificationCenter {
    class func notify(title: String, message: String) {
        let notification = NSUserNotification()
        notification.title = title
        notification.informativeText = message
        let center = NSUserNotificationCenter.defaultUserNotificationCenter()
        center.deliverNotification(notification)
    }
}

