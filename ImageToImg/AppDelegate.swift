import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate, NSUserNotificationCenterDelegate  {
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
        // TODO: Sett bilde som ble lagt på ikonet :)
        return true
    }
    
    func userNotificationCenter(center: NSUserNotificationCenter, shouldPresentNotification notification: NSUserNotification) -> Bool {
        return true
    }
}

