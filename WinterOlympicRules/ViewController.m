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
        //Set BackButton Background
        UIImage *backButtonImage = [[UIImage imageNamed:@"BackButton.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 13, 0, 6)];
        //[[UIBarButtonItem appearance]setBackButtonBackgroundImage:backButtonImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        //[[UIBarButtonItem appearance]setBackButtonBackgroundImage:backButtonImage forState:UIControlStateReserved barMetrics:UIBarMetricsDefault];
      [self.navigationController.navigationItem.backBarButtonItem setBackButtonBackgroundImage:backButtonImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        
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
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.frame];
    [imageView setImage:[UIImage imageNamed:@"Background"]];
    self.tableView.backgroundView = imageView;
    self.tableView.backgroundColor = [UIColor clearColor];
   
    
    
    
    
    
    
    // If you're worried that your users might not catch on to the fact that a search bar is available if they scroll to reveal it, a search icon will help them
    // If you don't hide your search bar in your app, don’t include this, as it would be redundant
    [self.sportSearchBar becomeFirstResponder];
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
        DetailViewController *DVC = [segue destinationViewController];
       
        
        NSIndexPath *indexPath = [self.searchDisplayController.searchResultsTableView indexPathForSelectedRow];
        if (indexPath.section==0) {
            [DVC setRuleString:[[self.mensFilteredArray objectAtIndex:indexPath.row]objectForKey:@"Rules"]];
            [DVC setDescriptionString:[[self.mensFilteredArray objectAtIndex:indexPath.row]objectForKey:@"Description"]];
            NSString *string = [NSString stringWithFormat:@"Men's %@",[[self.mensFilteredArray objectAtIndex:indexPath.row]objectForKey:@"Name"]];
            [DVC setNameString:string];


        }
        else{
            [DVC setRuleString:[[self.womensFilteredArray objectAtIndex:indexPath.row]objectForKey:@"Rules"]];
            [DVC setDescriptionString:[[self.womensFilteredArray objectAtIndex:indexPath.row]objectForKey:@"Description"]];
            NSString *string = [NSString stringWithFormat:@"Women's %@",[[self.womensFilteredArray objectAtIndex:indexPath.row]objectForKey:@"Name"]];
            [DVC setNameString:string];
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
    
    
    

}

-(void)searchDisplayController:(UISearchDisplayController *)controller didLoadSearchResultsTableView:(UITableView *)tableView {
    tableView.backgroundColor = self.tableView.backgroundColor;
    tableView.separatorColor = self.tableView.separatorColor;
    tableView.opaque=YES;
    tableView.tintColor = self.tableView.tintColor;
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
            return @"Men's Events";
        else
            return @"Women's Events";
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
        cell.backgroundColor = [UIColor lightTextColor];
        [cell.textLabel setTintColor:[UIColor whiteColor]];
        if (indexPath.section==0){

            
            //self.searchDisplayController.searchResultsTableView.backgroundColor=gray;
            //cell.backgroundColor = [UIColor lightTextColor];
           
            cell.textLabel.text=[[self.mensFilteredArray objectAtIndex:indexPath.row]objectForKey:@"Name"];}
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
