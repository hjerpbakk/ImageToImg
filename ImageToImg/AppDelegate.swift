import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate, NSUserNotificationCenterDelegate  {
    static var imageView: InputImageView?
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        NSUserNotificationCenter.defaultUserNotificationCenter().delegate = self
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }

    func applicationShouldTerminateAfterLastWindowClosed(sender: NSApplication) -> Bool {
        return true
    }
    
    @IBAction func ViewSource(sender: AnyObject) {
        let codeURL = NSURL(string: "https://github.com/Sankra/ImageToImg")!
        NSWorkspace.sharedWorkspace().openURL(codeURL)
    }
    
    func application(sender: NSApplication, openFile filename: String) -> Bool {
        setImage(filename)
        return true
    }
    
    func userNotificationCenter(center: NSUserNotificationCenter, shouldPresentNotification notification: NSUserNotification) -> Bool {
        return true
    }
    
    @IBAction func openImage(sender: NSMenuItem) {
        let openPanel = NSOpenPanel()
        openPanel.allowsMultipleSelection = false
        openPanel.canChooseDirectories = false
        openPanel.canCreateDirectories = false
        openPanel.canChooseFiles = true
        openPanel.allowedFileTypes = AppDelegate.imageView!.supportedExtensions
        openPanel.beginWithCompletionHandler { (result) -> Void in
            if result == NSFileHandlingPanelOKButton {
                if let url = openPanel.URL {
                    self.setImage(url.path!)
                }
            }
        }
    }
    
    func setImage(filename: String) {
        let image = NSImage(contentsOfFile: filename)!
        AppDelegate.imageView!.droppedFilePath = filename
        AppDelegate.imageView!.image = image
    }
}

