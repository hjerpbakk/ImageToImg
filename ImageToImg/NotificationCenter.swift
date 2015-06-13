import Foundation

class NotificationCenter {
    class func notify(title: String, message: String) {
        var notification = NSUserNotification()
        notification.title = title
        notification.informativeText = message
        var center:NSUserNotificationCenter = NSUserNotificationCenter.defaultUserNotificationCenter()
        center.deliverNotification(notification)
    }
}

