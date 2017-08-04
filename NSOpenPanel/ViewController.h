//
//  ViewController.h
//  NSOpenPanel
//
//  Created by Fan's iMac  on 2017/8/3.
//  Copyright © 2017年 Fan. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController

@property (unsafe_unretained) IBOutlet NSTextView *textView;
@property (weak) IBOutlet NSButton *saveBtn;
@property (weak) IBOutlet NSButton *colorBtn;
@property (weak) IBOutlet NSButton *fontBtn;

- (IBAction)chooseColor:(id)sender;
- (IBAction)chooseFont:(id)sender;
- (IBAction)saveDoc:(id)sender;

- (void)openDocument;

@end
