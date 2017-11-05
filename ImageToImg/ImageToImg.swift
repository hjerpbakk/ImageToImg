import Foundation
import AppKit

open class ImageToImg {
    open class func optimizeImageAndPutImgOnPasteboard(_ imagePath: String, image: NSImage) {
        let fileURLWithPath = URL(fileURLWithPath: imagePath)
        NSDocumentController.shared().noteNewRecentDocumentURL(fileURLWithPath)
        
        let imageOptimizer = ImageOptimizer()
        imageOptimizer.optimizeImageInPlace(imagePath)
        
        let imageName = fileURLWithPath.lastPathComponent
        let htmlGenerator = HTMLGenerator()
        let html = htmlGenerator.imgHtml(imageName, width: image.size.width, height: image.size.height)
        
        let pboard = NSPasteboard.general()
        pboard.clearContents()
        pboard.writeObjects([NSString(string:html)])
        
        NotificationCenter.notify("Img tag copied to the clipboard", message: "Ready to be pasted 🔗")
    }
}
