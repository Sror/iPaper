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
    BOOL flag;
    int setArrayObjectFlag;
    NSXMLParser *parser;
    NSString *element;
    NSMutableArray *newsTable;
    NSMutableDictionary *newsTableAttributes;
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
    
    return newsTable;
}

#pragma mark Parser Protocols

- (void)parserDidStartDocument:(NSXMLParser *)parser
{
    newsTable = [[NSMutableArray alloc] init];
    newsTableAttributes = NULL;
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    element = elementName;
    
    if([element isEqualToString:@"item"]) {
        flag = YES;                    // It tells whether the element: "item" has started or not.
    }
    if(!newsTableAttributes && ([element isEqualToString:@"title"] | [element isEqualToString:@"link"] | [element isEqualToString:@"description"])) {
        newsTableAttributes = [[NSMutableDictionary alloc] init];
        setArrayObjectFlag = 0;       // It sets the Dictionary as an object to Array when all 3 elements(Key in terms of Dictionary): "title", "link", "description" are set.
    }
    
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if (flag) {
        
        if ([element isEqualToString:@"title"]) {
            [newsTableAttributes setObject:string forKey:@"title"];
        }
        if ([element isEqualToString:@"link"]) {
            [newsTableAttributes setObject:string forKey:@"link"];
        }
        if ([element isEqualToString:@"description"]) {
            [newsTableAttributes setObject:string forKey:@"description"];
        }        
    }
    else {
    
    
    }
}


- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if([element isEqualToString:@"item"])
        flag = NO;
    
    if(flag && [element isEqualToString:@"title"] | [element isEqualToString:@"link"] | [element isEqualToString:@"description"]) {
        
        setArrayObjectFlag ++;
        
        if(setArrayObjectFlag == 3) {
            [newsTable addObject:newsTableAttributes];
            newsTableAttributes = NULL;
        }
    }

    element = nil;           // b'coz <item><title> Lorem Ipsum </title> Lorem Ipsum </item> ... Even when didEndElement: called after title  ends, var(element) still contains "title" instead of "item".
}


- (void)parserDidEndDocument:(NSXMLParser *)parser
{
    NSLog(@"%@", newsTable);
    
}

@end
