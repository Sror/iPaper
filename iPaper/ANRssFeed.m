//
//  ANRssFeed.m
//  iPaper
//
//  Created by Avinash Nehra on 10/9/13.
//  Copyright (c) 2013 Avinash Nehra. All rights reserved.
//

#import "ANRssFeed.h"

@interface ANRssFeed ()
{
    NSXMLParser *parser;
    NSString *element;
    BOOL flag;
    NSMutableArray *newsTable;
}
@end

@implementation ANRssFeed

-(NSArray *) parseFeed: (NSString *) stringUrl
{
    NSURL *url = [NSURL URLWithString:stringUrl];
    parser = [[NSXMLParser alloc] initWithContentsOfURL:url];
    [parser setDelegate:self];
    [parser setShouldResolveExternalEntities:NO];
    [parser parse];  
    
    return NULL;
}

#pragma mark Parser Protocols

- (void)parserDidStartDocument:(NSXMLParser *)parser
{
    newsTable = [[NSMutableArray alloc] init];
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    element = elementName;
    
    if([element isEqualToString:@"item"])
        flag = YES;
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if(flag && [element isEqualToString:@"title"])
    NSLog(@"FoundChars: %@", string);
    
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    
    if([element isEqualToString:@"item"])
        flag = NO;
    
//    NSLog(@"End: %@......... ", elementName);

    
}

@end
