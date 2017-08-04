//
//  ViewController.m
//  NSOpenPanel
//
//  Created by Fan's iMac  on 2017/8/3.
//  Copyright © 2017年 Fan. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"self vc = %@",self);
}

- (IBAction)chooseColor:(id)sender {
    NSColorPanel *colorPanel = [NSColorPanel sharedColorPanel];
    [colorPanel setAction:@selector(changeColor:)];
    [colorPanel setTarget:self];
    [colorPanel orderFront:nil];
}

- (void)changeColor:(NSColorPanel *)tColorPanel {
    NSLog(@"change color = %@",tColorPanel);
    self.textView.textColor = tColorPanel.color;
}


- (IBAction)chooseFont:(id)sender {
    NSFontManager *fontManager = [NSFontManager sharedFontManager];
    [fontManager setTarget:self];
    [fontManager setAction:@selector(changeFont:)];
    [fontManager orderFrontFontPanel:self];
}

- (void)changeFont:(NSFontManager *)tFontManager {
    self.textView.font = tFontManager.selectedFont;
}

- (IBAction)saveDoc:(id)sender {
    NSSavePanel *savePanel = [NSSavePanel savePanel];
    savePanel.title = @"选择要保存的文件";
    savePanel.message = @"详细信息";
    savePanel.allowedFileTypes = @[@"txt"];
    savePanel.nameFieldStringValue = @"savename";
    [savePanel beginWithCompletionHandler:^(NSModalResponse result) {
        if (result == NSFileHandlingPanelOKButton) {
            NSURL *url = [savePanel URL];
            NSLog(@"filePath url %@",url);
            NSString *text = self.textView.string;
            NSError *error;
            [text writeToURL:url atomically:YES encoding:NSUTF8StringEncoding error:&error];
            if (error) {
                NSLog(@"save file error = %@",error);
            }
        }
    }];
}

- (void)openDocument {
    NSOpenPanel *openPanel = [NSOpenPanel openPanel];
    openPanel.canChooseFiles = YES;
    openPanel.canChooseDirectories = YES;
    openPanel.allowsMultipleSelection = YES;
    openPanel.allowedFileTypes = @[@"txt"];
    [openPanel beginWithCompletionHandler:^(NSInteger result) {
        if (result == NSFileHandlingPanelOKButton) {
            NSArray *fileUrls = [openPanel URLs];
            for (NSURL *url in fileUrls) {
                NSError *error;
                NSString *string = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&error];
                if (!error) {
                    self.textView.string = string;
                }
            }
        }
    }];
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
