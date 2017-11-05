import Foundation

class NotificationCenter {
    class func notify(_ title: String, message: String) {
        let notification = NSUserNotification()
        notification.title = title
        notification.informativeText = message
        let center = NSUserNotificationCenter.default
        center.deliver(notification)
    }
}

