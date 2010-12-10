//
//  PromoLinksAppDelegate.h
//  PromoLinks
//
//  Created by Vinny Coyne on 10/12/2010.
//  Copyright 2010 App Sandwich. All rights reserved.
//	http://www.appsandwich.com
//

#import <Cocoa/Cocoa.h>

typedef enum {
	
	VCCodeTypeHTML = 0,
	VCCodeTypeVBulletin
	
} VCCodeType;


@interface PromoLinksAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
	
	IBOutlet NSPopUpButton* codeTypePopup;
	IBOutlet NSTextView* codeTextView;
	IBOutlet NSTextField* descriptionField;
}

@property (assign) IBOutlet NSWindow *window;


-(IBAction)generateCode:(id)sender;
-(IBAction)copyCode:(id)sender;
-(IBAction)clearCode:(id)sender;

@end
