//
//  ANHtmlFeed.h
//  iPaper
//
//  Created by Avinash Nehra on 10/15/13.
//  Copyright (c) 2013 Avinash Nehra. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ANHtmlFeed : NSObject <NSXMLParserDelegate, NSURLConnectionDataDelegate>


-(NSString *) parseFeed: (NSString *) stringUrl;

@end
