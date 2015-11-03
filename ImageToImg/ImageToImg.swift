import Foundation
import AppKit

public class ImageToImg {
    public class func optimizeImageAndPutImgOnPasteboard(imagePath: String, image: NSImage) {
        let fileURLWithPath = NSURL(fileURLWithPath: imagePath)
        NSDocumentController.sharedDocumentController().noteNewRecentDocumentURL(fileURLWithPath)
        
        let imageOptimizer = ImageOptimizer()
        imageOptimizer.optimizeImageInPlace(imagePath)
        
        let imageName = fileURLWithPath.lastPathComponent
        let htmlGenerator = HTMLGenerator()
        let html = htmlGenerator.imgHtml(imageName!, width: image.size.width, height: image.size.height)
        
        let pboard = NSPasteboard.generalPasteboard()
        pboard.clearContents()
        pboard.writeObjects([html])
        
        NotificationCenter.notify("Img tag copied to the clipboard", message: "Ready to be pasted 🔗")
    }
}