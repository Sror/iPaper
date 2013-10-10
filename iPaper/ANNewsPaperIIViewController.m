//
//  ANNewsPaperIIViewController.m
//  iPaper
//
//  Created by Avinash Nehra on 10/10/13.
//  Copyright (c) 2013 Avinash Nehra. All rights reserved.
//

#import "ANNewsPaperIIViewController.h"

@interface ANNewsPaperIIViewController ()

@end

@implementation ANNewsPaperIIViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Next" image:[UIImage imageNamed:@"showToolBarImage"] selectedImage:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
