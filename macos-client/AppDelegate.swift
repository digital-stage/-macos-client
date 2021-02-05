//
//  AppDelegate.swift
//  macos-client
//
//  Created by Tobias Hegemann on 05.02.21.
//

import Cocoa
import SwiftUI

@main
class AppDelegate: NSObject, NSApplicationDelegate {
    var popover: NSPopover!
    var statusBarItem: NSStatusItem!
    var loginSettings: LoginSettings!
    
    func SignIn(_ email: String, password: String) -> Void {
        if( email == "test@digital-stage.org" && password == "testtesttest" ) {
            self.loginSettings.error = ""
            print("LOGIN OK")
        } else {
            self.loginSettings.error = "FEHLER JUNGE"
        }
    }

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        self.loginSettings = LoginSettings()
        
        // Create the SwiftUI view that provides the window contents.
        let loginPanel = LoginPanel(SignIn: self.SignIn).environmentObject(self.loginSettings)

        // Create the popover
        let popover = NSPopover()
        popover.contentSize = NSSize(width: 400, height: 500)
        popover.behavior = .transient
        popover.contentViewController = NSHostingController(rootView: loginPanel)
        self.popover = popover
        
        // Create the status item
        self.statusBarItem = NSStatusBar.system.statusItem(withLength: CGFloat(NSStatusItem.variableLength))
        
        if let button = self.statusBarItem.button {
            button.image = NSImage(named: "Icon")
            button.action = #selector(togglePopover(_:))
        }
        
        print("HEY")
    }
    
    @objc func togglePopover(_ sender: AnyObject?) {
        if let button = self.statusBarItem.button {
            if self.popover.isShown {
                self.popover.performClose(sender)
            } else {
                self.popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
            }
        }
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

