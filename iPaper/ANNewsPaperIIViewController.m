//
//  ANNewsPaperIIViewController.m
//  iPaper
//
//  Created by Avinash Nehra on 10/10/13.
//  Copyright (c) 2013 Avinash Nehra. All rights reserved.
//

#import "ANNewsPaperIIViewController.h"
#import "ANViewController.h"

@interface ANNewsPaperIIViewController ()

@end

@implementation ANNewsPaperIIViewController

-(id) init {
    
    self = [super init];
    
    if(!self) {
        return nil;
    }
    
    self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Next" image:[UIImage imageNamed:@"showToolBarImage"] selectedImage:nil];    return self;
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
