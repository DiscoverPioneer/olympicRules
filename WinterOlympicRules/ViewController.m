//
//  ViewController.m
//  WinterOlympicRules
//
//  Created by Phil Scarfi on 1/17/14.
//  Copyright (c) 2014 Pioneer Mobile Applications. All rights reserved.
//

#import "ViewController.h"
#import "EventsViewController.h"
#import "DetailViewController.h"
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
    self.mensFilteredArray = [NSMutableArray arrayWithCapacity:[sportsArray count]];
    self.womensFilteredArray = [NSMutableArray arrayWithCapacity:[sportsArray count]];

    [self.sportSearchBar sizeToFit];

    

   
    
    
    
    
    
    
}

#pragma mark Content Filtering
-(void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope {
    // Update the filtered array based on the search text and scope.
    // Remove all objects from the filtered search array
    [self.mensFilteredArray removeAllObjects];
    [self.womensFilteredArray removeAllObjects];

    // Filter the array using NSPredicate
   // NSPredicate*p= [NSPredicate predicateWithFormat:@"ANY %K LIKE[cd] %@",@"Sport",[searchText stringByAppendingString:@"*"]];

    //NSPredicate *predicate1 = [NSPredicate predicateWithFormat:@"SELF.Sport CONTAINS[cd] %@",searchText];
    //NSPredicate *predicate2 = [NSPredicate predicateWithFormat:@"Mens[0].Name CONTAINS[cd]  %@",searchText];

   // NSPredicate * andPredicate = [NSCompoundPredicate andPredicateWithSubpredicates:[NSArray arrayWithObjects:predicate1,predicate2,nil]];

    
    
    
    searchText = [searchText lowercaseString];

    
    for (NSDictionary *itemDict in sportsArray)
    {
        NSArray *mensArray = (NSArray*)[itemDict objectForKey:@"Mens"];
        NSArray *womensArray = (NSArray*)[itemDict objectForKey:@"Womens"];

        for (NSDictionary *menItemDict in mensArray)
        {
            NSString *name = [menItemDict objectForKey:@"Name"];
            name = [name lowercaseString];
            if (([name rangeOfString:searchText].location != NSNotFound) && ![self.mensFilteredArray containsObject:itemDict] ) {
                [self.mensFilteredArray addObject:menItemDict];
                
            }
        }
            for (NSDictionary *menItemDict in womensArray)
            {
                NSString *name = [menItemDict objectForKey:@"Name"];
                name = [name lowercaseString];
                if (([name rangeOfString:searchText].location != NSNotFound) && ![self.womensFilteredArray containsObject:itemDict] ) {
                    [self.womensFilteredArray addObject:menItemDict];
                    
                }
            


            //Do the comparison here
        }
    }
    //NSLog(@"Count=%lu",(unsigned long)self.womensFilteredArray.count);
    
    

    
}
#pragma mark - UISearchDisplayController Delegate Methods

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    // Tells the table data source to reload when text changes
    [self filterContentForSearchText:searchString scope:
     [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}





-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if (sender == self.searchDisplayController.searchResultsTableView) {
        DetailViewController *EVC = [segue destinationViewController];
       
        
        NSIndexPath *indexPath = [self.searchDisplayController.searchResultsTableView indexPathForSelectedRow];
        if (indexPath.section==0) {
            [EVC setTitle:[[self.mensFilteredArray objectAtIndex:indexPath.row]objectForKey:@"Name"]];
            [EVC setRuleString:[[self.mensFilteredArray objectAtIndex:indexPath.row]objectForKey:@"Rules"]];
            [EVC setDescriptionString:[[self.mensFilteredArray objectAtIndex:indexPath.row]objectForKey:@"Description"]];


        }
        else{
            [EVC setTitle:[[self.womensFilteredArray objectAtIndex:indexPath.row]objectForKey:@"Name"]];
            [EVC setRuleString:[[self.womensFilteredArray objectAtIndex:indexPath.row]objectForKey:@"Rules"]];
            [EVC setDescriptionString:[[self.womensFilteredArray objectAtIndex:indexPath.row]objectForKey:@"Description"]];
        }
      

        
    }
    else{
        if ([segue.identifier isEqualToString:@"EventsViewController"]) {
            EventsViewController *EVC = [segue destinationViewController];
            NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
            [EVC setTitle:[[sportsArray objectAtIndex:indexPath.row]objectForKey:@"Sport"]];
            [EVC setEvents:[sportsArray objectAtIndex:indexPath.row]];
        }
    }
    
    
    
    
    
    
    
    
    /*
    if ([segue.identifier isEqualToString:@"EventsViewController"]) {
        EventsViewController *EVC = [segue destinationViewController];
        
        if (sender == self.searchDisplayController.searchResultsTableView) {
            NSIndexPath *indexPath = [self.searchDisplayController.searchResultsTableView indexPathForSelectedRow];
            [EVC setTitle:[[self.filteredArray objectAtIndex:indexPath.row]objectForKey:@"Name"]];
            [EVC setEvents:[self.filteredArray objectAtIndex:indexPath.row]];
        }
        else{
            NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
            [EVC setTitle:[[sportsArray objectAtIndex:indexPath.row]objectForKey:@"Sport"]];
            [EVC setEvents:[sportsArray objectAtIndex:indexPath.row]];
        }
    }
     */
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    if (tableView == self.searchDisplayController.searchResultsTableView)
        return 2;
    else
        return 1;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        if (section==0)
            return @"Men";
        else
            return @"Women";
    }
    else
        return @"Sports";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        if (section==0) {
            return self.mensFilteredArray.count;
        }
        else{
            return self.womensFilteredArray.count;
        }
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
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        if (indexPath.section==0)
            cell.textLabel.text=[[self.mensFilteredArray objectAtIndex:indexPath.row]objectForKey:@"Name"];
        else
            cell.textLabel.text=[[self.womensFilteredArray objectAtIndex:indexPath.row]objectForKey:@"Name"];

    }
    else
        cell.textLabel.text=[[sportsArray objectAtIndex:indexPath.row]objectForKey:@"Sport"];
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        [self performSegueWithIdentifier:@"DetailViewController" sender:tableView];
    }
    else{
        [self performSegueWithIdentifier:@"EventsViewController" sender:tableView];

    }

}














- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
