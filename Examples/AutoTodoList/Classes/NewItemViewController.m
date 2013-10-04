//
//  NewItemViewController.m
//  TodoList4
//
//  Created by Nick Lockwood on 15/04/2010.
//  Copyright 2010 Charcoal Design. All rights reserved.
//

#import "NewItemViewController.h"
#import "TodoList.h"
#import "TodoItem.h"


@interface NewItemViewController()

@property (nonatomic, strong) TodoItem *item;

@end


@implementation NewItemViewController

@synthesize item;

#pragma mark - UITextViewDelegate methods

- (void)textViewDidChange:(UITextView *)textView
{	
	if (item == nil)
	{
		//create a new TodoItem and add to list
		self.item = [TodoItem instanceWithLabel:textView.text];
		[[TodoList sharedInstance].items addObject:item];
	}
	else
	{
		//update the TodoItem
		item.label = textView.text;
	}
	
	//save the item
	[item save];
}

#pragma mark - Cleanup


@end
