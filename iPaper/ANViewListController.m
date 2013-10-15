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
    else {
    
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        NSString *selectedSubCategory = [tableView cellForRowAtIndexPath:indexPath].textLabel.text;
    
        rowTextItem = [self getSubCategoryRowData:selectedSubCategory];
        arrayContainsDictionary = YES;
        self.title = selectedSubCategory;
        [self.table reloadData];
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


-(NSArray *) getSubCategoryRowData:selectedSubCategory
{
    if ([self.selectedNewsCategory isEqualToString:@"Latest News"]) {
        
        if ([selectedSubCategory isEqualToString:@"Breaking News"]) {
            ANRssFeed *feed = [[ANRssFeed alloc] init];
            arrayContainsDictionary = YES;
            return [feed parseFeed:@"http://syndication.indianexpress.com/rss/latest-news.xml"];
        }
        
        if ([selectedSubCategory isEqualToString:@"India"]) {
            ANRssFeed *feed = [[ANRssFeed alloc] init];
            arrayContainsDictionary = YES;
            return [feed parseFeed:@"http://syndication.indianexpress.com/rss/798/latest-news.xml"];
        }
        
        if ([selectedSubCategory isEqualToString:@"World"]) {
            ANRssFeed *feed = [[ANRssFeed alloc] init];
            arrayContainsDictionary = YES;
            return [feed parseFeed:@"http://syndication.indianexpress.com/rss/789/latest-news.xml"];
        }
        
        if ([selectedSubCategory isEqualToString:@"Business"]) {
            ANRssFeed *feed = [[ANRssFeed alloc] init];
            arrayContainsDictionary = YES;
            return [feed parseFeed:@"http://syndication.indianexpress.com/rss/797/latest-news.xml"];
        }
        
        if ([selectedSubCategory isEqualToString:@"Sports"]) {
            ANRssFeed *feed = [[ANRssFeed alloc] init];
            arrayContainsDictionary = YES;
            return [feed parseFeed:@"http://syndication.indianexpress.com/rss/785/latest-news.xml"];
        }
        
        if ([selectedSubCategory isEqualToString:@"LifeStyle & Health"]) {
            ANRssFeed *feed = [[ANRssFeed alloc] init];
            arrayContainsDictionary = YES;
            return [feed parseFeed:@"http://syndication.indianexpress.com/rss/802/latest-news.xml"];

        }
        
    }
    
    if ([self.selectedNewsCategory isEqualToString:@"World News"]) {
        
        if ([selectedSubCategory isEqualToString:@"Asia"]) {
            ANRssFeed *feed = [[ANRssFeed alloc] init];
            arrayContainsDictionary = YES;
            return [feed parseFeed:@"http://syndication.indianexpress.com/rss/790/asia.xml"];
        }
        
        if ([selectedSubCategory isEqualToString:@"Europe"]) {
            ANRssFeed *feed = [[ANRssFeed alloc] init];
            arrayContainsDictionary = YES;
            return [feed parseFeed:@"http://syndication.indianexpress.com/rss/788/europe.xml"];
        }
        
        if ([selectedSubCategory isEqualToString:@"Middle East & Africa"]) {
            ANRssFeed *feed = [[ANRssFeed alloc] init];
            arrayContainsDictionary = YES;
            return [feed parseFeed:@"http://syndication.indianexpress.com/rss/791/middle-east---africa.xml"];
        }
        
        if ([selectedSubCategory isEqualToString:@"Americas"]) {
            ANRssFeed *feed = [[ANRssFeed alloc] init];
            arrayContainsDictionary = YES;
            return [feed parseFeed:@"http://syndication.indianexpress.com/rss/787/americas.xml"];
        }
        
    }
    
    if ([self.selectedNewsCategory isEqualToString:@"Express Opinion"]) {
        
        if ([selectedSubCategory isEqualToString:@"Editorial"]) {
            ANRssFeed *feed = [[ANRssFeed alloc] init];
            arrayContainsDictionary = YES;
            return [feed parseFeed:@"http://syndication.indianexpress.com/rss/35/editorials.xml"];
        }
        
        if ([selectedSubCategory isEqualToString:@"Editors' Picks"]) {
            ANRssFeed *feed = [[ANRssFeed alloc] init];
            arrayContainsDictionary = YES;
            return [feed parseFeed:@"http://syndication.indianexpress.com/rss/1117/editors-picks.xml"];
        }
        
        if ([selectedSubCategory isEqualToString:@"Columns"]) {
            ANRssFeed *feed = [[ANRssFeed alloc] init];
            arrayContainsDictionary = YES;
            return [feed parseFeed:@"http://syndication.indianexpress.com/rss/43/columns.xml"];
        }
        
        if ([selectedSubCategory isEqualToString:@"Express Columns"]) {
            ANRssFeed *feed = [[ANRssFeed alloc] init];
            arrayContainsDictionary = YES;
            return [feed parseFeed:@"http://syndication.indianexpress.com/rss/1295/express-columns.xml"];
        }
        
        if ([selectedSubCategory isEqualToString:@"OP-ED"]) {
            ANRssFeed *feed = [[ANRssFeed alloc] init];
            arrayContainsDictionary = YES;
            return [feed parseFeed:@"http://syndication.indianexpress.com/rss/36/oped.xml"];
        }
        
    }
    
    return NULL;

}

@end
