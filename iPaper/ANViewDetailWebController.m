//
//  ANViewDetailWebController.m
//  iPaper
//
//  Created by Avinash Nehra on 10/11/13.
//  Copyright (c) 2013 Avinash Nehra. All rights reserved.
//

#import "ANViewDetailWebController.h"

@interface ANViewDetailWebController ()

@end

@implementation ANViewDetailWebController

-(id) init {
    
    self = [super init];
    
    if(!self) {
        return nil;
    }
    
    return self;
}

//-(void)viewWillAppear: (BOOL)animated
//{
//    [super viewWillAppear:animated];
//    [self.tabBarController.tabBar setHidden:YES];
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view. 
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.pageUrl]];
    CGRect frame = CGRectMake(self.navigationController.view.frame.origin.x, self.navigationController.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height);
    UIWebView *showPage = [[UIWebView alloc] initWithFrame:frame];
    [self.view addSubview:showPage];
    
    [showPage loadRequest:request];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
