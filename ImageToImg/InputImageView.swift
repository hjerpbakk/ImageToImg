import Cocoa

class InputImageView: NSImageView, NSDraggingDestination {   
    var droppedFilePath: String?
    
    var supportedExtensions: [String]
    let draggedImage: NSImage
    let dndImage: NSImage
    
    required init?(coder: NSCoder) {
        dndImage = NSImage(named: "dnd")!
        draggedImage = NSImage(named: "dragged")!
        
        supportedExtensions = [String]()
        let documentTypes = NSBundle.mainBundle().infoDictionary?["CFBundleDocumentTypes"] as! NSArray
        for docInfo in documentTypes {
            let extensions = (docInfo as! NSDictionary)["CFBundleTypeExtensions"] as! NSArray
            for ext in extensions {
                supportedExtensions.append(ext as! String)
            }
        }
        
        super.init(coder: coder)
        registerForDraggedTypes([NSFilenamesPboardType, NSURLPboardType, NSPasteboardTypeTIFF])
        AppDelegate.imageView = self
    }
  
    override func draggingEntered(sender: NSDraggingInfo) -> NSDragOperation {
        if isImage(sender) {
            image = draggedImage
            return .Copy
        } else {
            image = dndImage
            return .None
        }
    }
    
    override func draggingExited(sender: NSDraggingInfo?) {
        image = dndImage
    }
    
    override func performDragOperation(sender: NSDraggingInfo) -> Bool {
        if let board = sender.draggingPasteboard().propertyListForType("NSFilenamesPboardType") as? NSArray {
            if let imagePath = board[0] as? String {
                droppedFilePath = imagePath
                return true
            }
        }
        
        droppedFilePath = nil
        return false
    }    
   
    func isImage(drag: NSDraggingInfo) -> Bool {
        if let board = drag.draggingPasteboard().propertyListForType("NSFilenamesPboardType") as? NSArray {
            if let url = NSURL(fileURLWithPath: (board[0] as! String)) {
                let suffix = url.pathExtension!
                for ext in self.supportedExtensions {
                    if ext == suffix {
                        return true
                    }
                }
            }
        }
        return false
    }
   
}
