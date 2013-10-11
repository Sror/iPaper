//
//  ANViewListController.m
//  iPaper
//
//  Created by Avinash Nehra on 10/11/13.
//  Copyright (c) 2013 Avinash Nehra. All rights reserved.
//

#import "ANViewListController.h"
#import "ANRssFeed.h"
#import "ANViewDetailWebController.h"

@interface ANViewListController ()
{
    NSArray *rowTextItem;
    BOOL arrayContainsDictionary;
}

@end

@implementation ANViewListController

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
    self.title = self.selectedNewsCategory;
    self.table = [self createTable];
    
    arrayContainsDictionary = NO;
    
    [self.view addSubview:self.table];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableView *) createTable
{
    CGRect navigationViewSizeModifiedHeight = CGRectMake(self.navigationController.view.frame.origin.x, self.navigationController.view.frame.origin.y, self.navigationController.view.frame.size.width, self.navigationController.view.frame.size.height);
    UITableView *createdTable = [[UITableView alloc] initWithFrame:navigationViewSizeModifiedHeight style:UITableViewStylePlain];
    createdTable.backgroundColor = [UIColor colorWithRed:1.0 green:160/255.f blue:50/255.f alpha:1.0];
    createdTable.separatorColor = [UIColor blackColor];
    createdTable.separatorInset = UIEdgeInsetsMake(0, 15, 0, 15);
    
    createdTable.dataSource = self;
    createdTable.delegate = self;
    
    return createdTable;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self getRowData] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"NewsCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        
        if(!rowTextItem) {
            rowTextItem = [self getRowData];
        }
    }
    
    cell.backgroundColor = [UIColor clearColor];
    
    
    if (arrayContainsDictionary) {
            cell.textLabel.text = [rowTextItem[indexPath.row] objectForKey:@"title"];
            cell.detailTextLabel.text = [rowTextItem[indexPath.row] objectForKey:@"description"];
    }
    else {
            cell.textLabel.text = rowTextItem[indexPath.row];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(arrayContainsDictionary) {
        
    
    }
    
    
}




-(NSArray *) getRowData
{
    if ([self.selectedNewsCategory isEqualToString:@"Latest News"]) {
        return [NSArray arrayWithObjects:@"Breaking News", @"India", @"World", @"Business", @"Sports", @"LifeStyle & Health", nil];
    }
    
    if ([self.selectedNewsCategory isEqualToString:@"International"]) {
        ANRssFeed *feed = [[ANRssFeed alloc] init];
        arrayContainsDictionary = YES;
        return [feed parseFeed:@"http://syndication.indianexpress.com/rss/38/international.xml"];        
    }
    
    if ([self.selectedNewsCategory isEqualToString:@"World News"]) {
        return [NSArray arrayWithObjects:@"Asia", @"Europe", @"Middle East & Africa", @"Americas", nil];
    }
    
    if ([self.selectedNewsCategory isEqualToString:@"Front Page"]) {
        ANRssFeed *feed = [[ANRssFeed alloc] init];
        arrayContainsDictionary = YES;
        return [feed parseFeed:@"http://syndication.indianexpress.com/rss/33/front-page.xml"];
    }
    
    if ([self.selectedNewsCategory isEqualToString:@"Express Opinion"]) {
        return [NSArray arrayWithObjects:@"Editorial", @"Editors' Picks", @"Columns", @"Express Columns", @"OP-ED", nil];
    }  
    
    return NULL;
}


@end
