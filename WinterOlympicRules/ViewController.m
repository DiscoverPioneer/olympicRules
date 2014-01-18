//
//  ViewController.m
//  WinterOlympicRules
//
//  Created by Phil Scarfi on 1/17/14.
//  Copyright (c) 2014 Pioneer Mobile Applications. All rights reserved.
//

#import "ViewController.h"
#import "EventsViewController.h"
@interface ViewController (){
    NSMutableArray *sportsArray;
    UISearchDisplayController *searchDisplayController;

}

@end

@implementation ViewController
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSString *path =[[NSBundle mainBundle]pathForResource:@"Sports" ofType:@"plist"];
    sportsArray = [[NSMutableArray alloc] initWithContentsOfFile:path];
    // Initialize the filteredCandyArray with a capacity equal to the candyArray's capacity
    self.filteredArray = [NSMutableArray arrayWithCapacity:[sportsArray count]];
    
    [self.sportSearchBar sizeToFit];

    
    
   
    
    
    
    
    
    
}

#pragma mark Content Filtering
-(void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope {
    // Update the filtered array based on the search text and scope.
    // Remove all objects from the filtered search array
    [self.filteredArray removeAllObjects];
    // Filter the array using NSPredicate
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF['Sport'] CONTAINS[cd] %@",searchText];
    self.filteredArray = [NSMutableArray arrayWithArray:[sportsArray filteredArrayUsingPredicate:predicate]];
    NSLog(@"%@",self.filteredArray);
}
#pragma mark - UISearchDisplayController Delegate Methods
-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString {
    // Tells the table data source to reload when text changes
    [self filterContentForSearchText:searchString scope:
     [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    // Return YES to cause the search result table view to be reloaded.
    NSLog(@"Called");
    return YES;
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption {
    // Tells the table data source to reload when scope bar selection changes
    [self filterContentForSearchText:self.searchDisplayController.searchBar.text scope:
     [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:searchOption]];
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}



-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"EventsViewController"]) {
        EventsViewController *EVC = [segue destinationViewController];
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        if (self.tableView == self.searchDisplayController.searchResultsTableView) {
            [EVC setTitle:[[self.filteredArray objectAtIndex:indexPath.row]objectForKey:@"Sport"]];
            [EVC setEvents:[self.filteredArray objectAtIndex:indexPath.row]];
        }
        else{
            [EVC setTitle:[[sportsArray objectAtIndex:indexPath.row]objectForKey:@"Sport"]];
            [EVC setEvents:[sportsArray objectAtIndex:indexPath.row]];
        }
    }
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Sports";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    
    if (self.tableView == self.searchDisplayController.searchResultsTableView) {
        return self.filteredArray.count;
    }
    else
        return sportsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    if (self.tableView == self.searchDisplayController.searchResultsTableView) {
        cell.textLabel.text=[[self.filteredArray objectAtIndex:indexPath.row]objectForKey:@"Sport"];
    }
    else
        cell.textLabel.text=[[sportsArray objectAtIndex:indexPath.row]objectForKey:@"Sport"];
    return cell;
}

















- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
