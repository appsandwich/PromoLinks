//
//  PromoLinksAppDelegate.m
//  PromoLinks
//
//  Created by Vinny Coyne on 10/12/2010.
//  Copyright 2010 App Sandwich. All rights reserved.
//	http://www.appsandwich.com
//


#import "PromoLinksAppDelegate.h"

@implementation PromoLinksAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	// Insert code here to initialize your application 
	
	[codeTypePopup removeAllItems];
	[codeTypePopup insertItemWithTitle:@"HTML" atIndex:VCCodeTypeHTML];
	[codeTypePopup insertItemWithTitle:@"vBulletin" atIndex:VCCodeTypeVBulletin];
	
	[descriptionField setStringValue:@"Paste your promo codes into the box to the left.\n\nSelect a link format (e.g. HTML, vBulletin).\n\nThen click Generate - your promo codes will be replaced with formatted links.\n\nThe Copy button copies the links to the Pasteboard."];
}

-(IBAction)generateCode:(id)sender
{
	NSString* templateString = nil;
	
	NSMutableString* outputString = [NSMutableString string];
	
	switch ([codeTypePopup indexOfSelectedItem])
	{
		case VCCodeTypeHTML:
			templateString = @"<a href=\"https://phobos.apple.com/WebObjects/MZFinance.woa/wa/freeProductCodeWizard?code=%@\">%@</a>";
			break;
			
		case VCCodeTypeVBulletin:
			templateString = @"[URL=\"https://phobos.apple.com/WebObjects/MZFinance.woa/wa/freeProductCodeWizard?code=%@\"]%@[/URL]";
			break;
	}
	
	if (!templateString)
		return;
	
	NSString* codesString = [codeTextView string];
	
	if ((!codesString) || ([codesString length] == 0))
		return;
	
	NSArray* codes = [codesString componentsSeparatedByString:@"\n"];
	
	if ((!codes) || ([codes count] == 0))
		return;
	
	for (NSString* code in codes)
	{
		if ((code) && ([code length] > 0))
		{
			NSString* formattedCode = [NSString stringWithFormat:templateString, code, code];
			[outputString appendFormat:@"%@\n", formattedCode];
		}
	}
	
	[codeTextView setString:outputString];
}

-(IBAction)copyCode:(id)sender
{
	NSPasteboard *pb = [NSPasteboard generalPasteboard];
	NSArray *types = [NSArray arrayWithObjects:NSStringPboardType, nil];
	[pb declareTypes:types owner:self];
	[pb setString:[codeTextView string] forType:NSStringPboardType];
}

-(IBAction)clearCode:(id)sender
{
	[codeTextView setString:@""];
}

@end
