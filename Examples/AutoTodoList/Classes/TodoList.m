//
//  TodoList.m
//  TodoListExample
//
//  Created by Nick Lockwood on 28/07/2011.
//  Copyright 2011 Charcoal Design. All rights reserved.
//

#import "TodoList.h"
#import "TodoItem.h"


@implementation TodoList

@synthesize items;

- (void)setUp
{
	NSLog(@"-[%@ %@];",NSStringFromClass(self.class),NSStringFromSelector(_cmd));
    self.items = NSMutableArray.new;
}

- (void)setWithArray:(NSArray *)array
{
	NSLog(@"Resource file:%@\nSave file:%@", self.class.resourceFile, self.class.saveFile);
	NSLog(@"-[%@ %@%@];", NSStringFromClass(self.class), NSStringFromSelector(_cmd), array);
	//initialise with default list from plist
	[items setArray:[TodoItem instancesWithArray:array]];
}

//note: we've not implemented the NSCoding methods
//the AutoCoding library takes care of this for us

- (BOOL) useHRCoderIfAvailable { return YES; }

@end
