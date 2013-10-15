//
//  ANViewController.m
//  iPaper
//
//  Created by Avinash Nehra on 10/9/13.
//  Copyright (c) 2013 Avinash Nehra. All rights reserved.
//

#import "ANViewController.h"
#import "ANViewListController.h"
#import "ANRssFeed.h"

#define kTitle @"iPaper"

@interface ANViewController ()
{
    NSMutableArray *newsPapers;
    NSArray *rowTextItem;
}

@end

@implementation ANViewController

-(id) init {

    self = [super init];
    
    if(!self) {
        return nil;
    }
    
    self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Indian Express" image:[UIImage imageNamed:@"newsPaper"] selectedImage:nil];    
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:240/255.f green:240/255.f blue:240/255.f alpha:1.0];
    [self.navigationItem setBackBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"iPaper" style:UIBarButtonItemStylePlain target:nil action:nil]];
    self.navigationItem.titleView = [self navigationTitleView];    
    
    self.table = [self createTable];
    
    [self.view addSubview:self.table];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



# pragma mark UI Design Methods

-(UITableView *) createTable
{
    CGRect navigationViewSizeModifiedHeight = CGRectMake(self.navigationController.view.frame.origin.x, self.navigationController.view.frame.origin.y, self.navigationController.view.frame.size.width, self.navigationController.view.frame.size.height);
    UITableView *createdTable = [[UITableView alloc] initWithFrame:navigationViewSizeModifiedHeight style:UITableViewStylePlain];
    createdTable.backgroundColor = [UIColor colorWithRed:1.0 green:160/255.f blue:50/255.f alpha:1.0];
    createdTable.separatorColor = [UIColor blackColor];
    createdTable.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    
    createdTable.dataSource = self;
    createdTable.delegate = self;

    return createdTable;
}


#pragma mark Dealing with RSS

-(void) addRSS
{
    self.navigationItem.titleView = [self navigationTitleViewAddRSS];
    ANRssFeed *feed = [[ANRssFeed alloc] init];
    [feed parseFeed:@"http://www.indianexpress.com/news/iran-has-more-uranium-than-it-needs-speaker/1180677/"];
//    http://feeds.bbci.co.uk/news/rss.xml?edition=int
//    http://syndication.indianexpress.com/rss/723/sunday-stories.xml

}


# pragma mark Table Protocols

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Indian Express";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"NewsCell";
    rowTextItem = [NSArray arrayWithObjects:@"Latest News", @"International", @"World News", @"Front Page", @"Express Opinion", nil];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = rowTextItem[indexPath.row];
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    ANViewListController *listView = [[ANViewListController alloc] init];
    listView.selectedNewsCategory = [rowTextItem objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:listView animated:YES];    
}


# pragma mark Navigation Customization

-(UIView *) navigationTitleView
{
    CGFloat navBarHeight = self.navigationController.navigationBar.frame.size.height;
    CGFloat navBarWidth = self.navigationController.navigationBar.frame.size.width;
    CGRect navigationBarSize = CGRectMake(self.navigationController.navigationBar.frame.origin.x, self.navigationController.navigationBar.frame.origin.y, navBarWidth, navBarHeight);
    
    UIView *containerView = [[UIView alloc] initWithFrame:navigationBarSize];
    
    UIImage *showToolBarImage = [UIImage imageNamed:@"rssLogo"];
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
    
    [containerView addSubview:self.showToolBarButton];
    [containerView addSubview:containerViewTitle];
    
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
    
    
    [addRssButton addTarget:self action:@selector(addRSS) forControlEvents:UIControlEventTouchUpInside];
    
    
    return containerView;
    
}

@end

