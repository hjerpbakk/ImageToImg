import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
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
}

