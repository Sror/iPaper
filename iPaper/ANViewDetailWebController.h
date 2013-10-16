//
//  ANViewDetailWebController.h
//  iPaper
//
//  Created by Avinash Nehra on 10/11/13.
//  Copyright (c) 2013 Avinash Nehra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ANViewDetailWebController : UIViewController

@property (weak, nonatomic) UIWebView *showPage;
@property (copy, nonatomic) NSString *pageUrl;
@end
