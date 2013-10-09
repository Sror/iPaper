//
//  ANRssFeed.m
//  iPaper
//
//  Created by Avinash Nehra on 10/9/13.
//  Copyright (c) 2013 Avinash Nehra. All rights reserved.
//

#import "ANRssFeed.h"

@implementation ANRssFeed

-(NSArray *) parseFeed: (NSString *) stringUrl
{
    NSURL *url = [NSURL URLWithString:stringUrl];
    NSXMLParser *parser = [[NSXMLParser alloc] initWithContentsOfURL:url];
    [parser setDelegate:self];
    [parser parse];
    
    
}

@end
