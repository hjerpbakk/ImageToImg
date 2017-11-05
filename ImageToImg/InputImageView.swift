import Cocoa

class InputImageView: NSImageView {
    var droppedFilePath: String?
    
    var supportedExtensions: [String]
    let draggedImage: NSImage
    let dndImage: NSImage
    
    var imageAlreadySet = false
    
    required init?(coder: NSCoder) {
        dndImage = NSImage(named: "dnd")!
        draggedImage = NSImage(named: "dragged")!
        supportedExtensions = [String]()
        super.init(coder: coder)
        
        populateSupportedFileTypeList()
        register(forDraggedTypes: [NSFilenamesPboardType, NSURLPboardType, NSPasteboardTypeTIFF])
        AppDelegate.imageView = self
    }
    
    override var image : NSImage?{
        didSet {
            if (image == dndImage || image == draggedImage) {
                return
            }
            
            imageAlreadySet = true
            ImageToImg.optimizeImageAndPutImgOnPasteboard(droppedFilePath!, image: image!)
        }
    }
  
    override func draggingEntered(_ sender: NSDraggingInfo) -> NSDragOperation {
        if isImage(sender) {
            if (!imageAlreadySet) {
                image = draggedImage
            }
            
            if let imagePath = getFilePath(sender) {
                droppedFilePath = imagePath
            } else {
                droppedFilePath = nil
            }

            return .copy
        } else {
            if (!imageAlreadySet) {
                image = dndImage
            }
            
            return NSDragOperation()
        }
    }
    
    override func draggingExited(_ sender: NSDraggingInfo?) {
        if (!imageAlreadySet) {
            image = dndImage
        }
    }
    
    func populateSupportedFileTypeList() {
        let documentTypes = Bundle.main.infoDictionary?["CFBundleDocumentTypes"] as! NSArray
        for docInfo in documentTypes {
            let extensions = (docInfo as! NSDictionary)["CFBundleTypeExtensions"] as! NSArray
            for ext in extensions {
                supportedExtensions.append(ext as! String)
            }
        }
    }
   
    func isImage(_ drag: NSDraggingInfo) -> Bool {
        if let imagePath = getFilePath(drag) {
            let url = URL(fileURLWithPath: imagePath)
            return supportedExtensions.contains(url.pathExtension)
        }
        
        return false
    }
    
    func getFilePath(_ sender: NSDraggingInfo?) -> String? {
        if let draggingInfo = sender {
            if let board = draggingInfo.draggingPasteboard().propertyList(forType: "NSFilenamesPboardType") as? NSArray {
                return board[0] as? String
            }
        }
        
        return nil
    }
}
