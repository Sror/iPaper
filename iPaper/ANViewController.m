//
//  ANViewController.m
//  iPaper
//
//  Created by Avinash Nehra on 10/9/13.
//  Copyright (c) 2013 Avinash Nehra. All rights reserved.
//

#import "ANViewController.h"
#import "ANRssFeed.h"

#define labelWidth 40
#define kTitle @"iPaper"

@interface ANViewController ()
{
    NSMutableArray *newsPapers;
}

@end

@implementation ANViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:240/255.f green:240/255.f blue:240/255.f alpha:1.0];
    self.navigationItem.titleView = [self navigationTitleView];
    self.navigationController.toolbarHidden = NO;
    [self setToolBarSegmentControl:[self createSegmentedControl]];
    
    self.table = [self createTable];
    
    [self.view addSubview:self.table];
    [self.navigationController.toolbar addSubview:self.toolBarSegmentControl];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



# pragma mark UI Design Methods

-(UITableView *) createTable
{
    CGRect navigationViewSizeModifiedHeight = CGRectMake(self.navigationController.view.frame.origin.x, self.navigationController.view.frame.origin.y, self.navigationController.view.frame.size.width, self.navigationController.view.frame.size.height-labelWidth);
    UITableView *createdTable = [[UITableView alloc] initWithFrame:navigationViewSizeModifiedHeight];
    createdTable.backgroundColor = [UIColor colorWithRed:1.0 green:160/255.f blue:50/255.f alpha:1.0];
    createdTable.separatorColor = [UIColor blackColor];
    
    return createdTable;
}

-(UISegmentedControl *) createSegmentedControl
{
//    CGRect navigationToolbarSize = CGRectMake(self.navigationController.toolbar.frame.origin.x, self.navigationController.toolbar.frame.origin.y, self.navigationController.toolbar.frame.size.width, self.navigationController.toolbar.frame.size.height);
    
    UISegmentedControl *createdSegment = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"One", @"Two", @"Three",nil]];
    createdSegment.tintColor = [UIColor blackColor];
//    createdSegment.frame = navigationToolbarSize;
    
    return createdSegment;
}


#pragma mark Dealing with RSS

-(void) addRSS
{
//    self.navigationItem.titleView = [self navigationTitleViewAddRSS];
    ANRssFeed *feed = [[ANRssFeed alloc] init];
    [feed parseFeed:@"http://syndication.indianexpress.com/rss/latest-news.xml"];
//http://www.thehindu.com/news/international/world/?service=rss
//    http://syndication.indianexpress.com/rss/latest-news.xml
}

# pragma mark Table Protocols

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [newsPapers count];
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NULL;
}

-(void) getRSSFeed
{
    //    NSURL *urlString = [NSURL URLWithString:@""];
    
}


# pragma mark Navigation Customization

-(UIView *) navigationTitleView
{
    CGFloat navBarHeight = self.navigationController.navigationBar.frame.size.height;
    CGFloat navBarWidth = self.navigationController.navigationBar.frame.size.width;
    CGRect navigationBarSize = CGRectMake(self.navigationController.navigationBar.frame.origin.x, self.navigationController.navigationBar.frame.origin.y, navBarWidth, navBarHeight);
    
    UIView *containerView = [[UIView alloc] initWithFrame:navigationBarSize];
    
    
    UIImage *showToolBarImage = [UIImage imageNamed:@"AddLink"];
    self.showToolBarButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
       
    CGFloat buttonY = (navBarHeight - showToolBarImage.size.height)/2;
    CGFloat buttonX = navBarWidth - (showToolBarImage.size.width + buttonY*2);
    CGFloat buttonWidth = showToolBarImage.size.width;
    CGFloat buttonHeight = showToolBarImage.size.height;
    [self.showToolBarButton setFrame:CGRectMake(buttonX, buttonY, buttonWidth, buttonHeight)];
    [self.showToolBarButton setImage:showToolBarImage forState:UIControlStateNormal];
    
    
    //     NSLog(@"Bar Size: %@ Frame: %@ Size:%@", NSStringFromCGRect(self.navigationController.navigationBar.frame), NSStringFromCGRect(addLinkButton.frame), NSStringFromCGSize(addLinkImage.size));
    CGFloat lWidth = 100;
    CGFloat lHeight = navBarHeight/1.5;
    UILabel *containerViewTitle = [[UILabel alloc] initWithFrame:CGRectMake((navBarWidth/2) - (lWidth/2), (navBarHeight - lHeight)/2, lWidth, lHeight)];
    containerViewTitle.font = [UIFont fontWithName:@"Zapfino" size:14];
    containerViewTitle.text = kTitle;
    containerViewTitle.textAlignment = NSTextAlignmentCenter;
    
    
    UIImage *rssLogo = [UIImage imageNamed:@"rssLogo"];
    CGFloat imageViewY = (navBarHeight - rssLogo.size.height)/2;
    CGFloat imageViewX = 0;
    
    UIImageView *rssLogoView = [[UIImageView alloc] initWithFrame:CGRectMake(imageViewX, imageViewY, buttonWidth, buttonHeight)];
    [rssLogoView setImage:rssLogo];
    
    
    [containerView addSubview:self.showToolBarButton];
    [containerView addSubview:containerViewTitle];
    [containerView addSubview:rssLogoView];
    
    
    [self.showToolBarButton addTarget:self action:@selector(addRSS) forControlEvents:UIControlEventTouchUpInside];
    
    return containerView;
}

-(UIView *) navigationTitleViewAddRSS
{
    
    CGFloat navBarHeight = self.navigationController.navigationBar.frame.size.height;
    CGFloat navBarWidth = self.navigationController.navigationBar.frame.size.width;
    CGRect navigationBarSize = CGRectMake(self.navigationController.navigationBar.frame.origin.x, self.navigationController.navigationBar.frame.origin.y, navBarWidth, navBarHeight);
    
    UIView *containerView = [[UIView alloc] initWithFrame:navigationBarSize];
    
    UITextField *addRSS = [[UITextField alloc] initWithFrame:CGRectMake(0, navBarHeight/4, navBarWidth - (self.showToolBarButton.frame.size.width*1.5), navBarHeight/2)];
    addRSS.backgroundColor = [UIColor whiteColor];
    addRSS.borderStyle = UITextBorderStyleRoundedRect;
    addRSS.placeholder = @"Enter the RSS link";
    
    UIButton *addRssButton = [[UIButton alloc] initWithFrame:self.showToolBarButton.frame];
    [addRssButton setImage:self.showToolBarButton.imageView.image forState:UIControlStateNormal];
    
    [containerView addSubview:addRSS];
    [containerView addSubview:addRssButton];
    
    
    [addRssButton addTarget:self action:@selector(getRSSFeed) forControlEvents:UIControlEventTouchUpInside];
    
    
    return containerView;
    
}

@end

