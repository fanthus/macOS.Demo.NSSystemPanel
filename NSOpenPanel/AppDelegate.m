//
//  AppDelegate.m
//  NSOpenPanel
//
//  Created by Fan's iMac  on 2017/8/3.
//  Copyright © 2017年 Fan. All rights reserved.
//

#import "AppDelegate.h"
#import "FRWindow.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


- (IBAction)openDocument:(id)sender {
    
    NSWindow *frwindow = (FRWindow *)[NSApplication sharedApplication].mainWindow;
    ViewController *vc = (ViewController *)[frwindow contentViewController];
    [vc openDocument];

}
@end
