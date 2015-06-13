import Foundation
import AppKit

public class ImageToImg {
    public init() {
    }

    public func optimizeImageAndPutImgOnPasteboard(imagePath: String, image: NSImage) {
        let imageOptimizer = ImageOptimizer()
        imageOptimizer.optimizeImageInPlace(imagePath)
        
        let imageName = imagePath.lastPathComponent
        let htmlGenerator = HTMLGenerator()
        var html = htmlGenerator.imgHtml(imageName, width: image.size.width, height: image.size.height)
        
        var pboard = NSPasteboard.generalPasteboard()
        pboard.clearContents()
        pboard.writeObjects([html])
        
        notify("Img tag copied to the clipboard", message: "Ready to be pasted 🔗")
    }
    
    func notify(title: String, message: String) {
        var notification = NSUserNotification()
        notification.title = title
        notification.informativeText = message
        var center:NSUserNotificationCenter = NSUserNotificationCenter.defaultUserNotificationCenter()
        center.deliverNotification(notification)
    }
}