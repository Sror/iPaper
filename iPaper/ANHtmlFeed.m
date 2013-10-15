//
//  ANHtmlFeed.m
//  iPaper
//
//  Created by Avinash Nehra on 10/15/13.
//  Copyright (c) 2013 Avinash Nehra. All rights reserved.
//

#import "ANHtmlFeed.h"

@interface ANHtmlFeed ()
{
    NSURLConnection *connection;
    NSMutableData *responseData;
    
    NSXMLParser *parser;
    NSString *element;
}
@end

@implementation ANHtmlFeed

-(NSString *) parseFeed: (NSString *) stringUrl
{
    [self getHtmlData:stringUrl];
    
  
    
    return 0;
}

#pragma mark Fetching HTML data

-(void) getHtmlData:stringUrl
{
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:stringUrl]];
    connection = [NSURLConnection connectionWithRequest:request delegate:self];
    
    if(connection) {
        responseData = [NSMutableData data];
        [connection start];
    }
    else {
        NSLog(@"Connection Failed");
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [responseData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [responseData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    parser = [[NSXMLParser alloc] initWithData:responseData];
    [parser setDelegate:self];
    [parser setShouldResolveExternalEntities:NO];
    [parser parse];    
}

#pragma mark Parser Protocols

- (void)parserDidStartDocument:(NSXMLParser *)parser
{
    
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    element = elementName;
    
    NSLog(@"Element Starts: %@", elementName);
    NSLog(@"Element Attribute Dict: %@", attributeDict);
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
     NSLog(@"Data: %@", string);
}


- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    NSLog(@"Element Ends: %@", elementName);
}


- (void)parserDidEndDocument:(NSXMLParser *)parser
{
    
}

@end
