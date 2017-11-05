import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate, NSUserNotificationCenterDelegate  {
    static var imageView: InputImageView?
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        NSUserNotificationCenter.default.delegate = self
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }
    
    @IBAction func ViewSource(_ sender: AnyObject) {
        let codeURL = URL(string: "https://github.com/Sankra/ImageToImg")!
        NSWorkspace.shared().open(codeURL)
    }
    
    func application(_ sender: NSApplication, openFile filename: String) -> Bool {
        setImage(filename)
        return true
    }
    
    func userNotificationCenter(_ center: NSUserNotificationCenter, shouldPresent notification: NSUserNotification) -> Bool {
        return true
    }
    
    @IBAction func openImage(_ sender: NSMenuItem) {
        let openPanel = NSOpenPanel()
        openPanel.allowsMultipleSelection = false
        openPanel.canChooseDirectories = false
        openPanel.canCreateDirectories = false
        openPanel.canChooseFiles = true
        openPanel.allowedFileTypes = AppDelegate.imageView!.supportedExtensions
        openPanel.begin { (result) -> Void in
            if result == NSFileHandlingPanelOKButton {
                if let url = openPanel.url {
                    self.setImage(url.path)
                }
            }
        }
    }
    
    func setImage(_ filename: String) {
        let image = NSImage(contentsOfFile: filename)!
        AppDelegate.imageView!.droppedFilePath = filename
        AppDelegate.imageView!.image = image
    }
}

