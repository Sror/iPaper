//
//  ANRssFeed.h
//  iPaper
//
//  Created by Avinash Nehra on 10/9/13.
//  Copyright (c) 2013 Avinash Nehra. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ANRssFeed : NSObject <NSXMLParserDelegate>

-(NSArray *) parseFeed: (NSString *) stringUrl;

@end
