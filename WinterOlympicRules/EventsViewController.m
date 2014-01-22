//
//  EventsViewController.m
//  WinterOlympicRules
//
//  Created by Phil Scarfi on 1/17/14.
//  Copyright (c) 2014 Pioneer Mobile Applications. All rights reserved.
//

#import "EventsViewController.h"
#import "DetailViewController.h"
@interface EventsViewController (){
    NSArray *mensArray;
    NSArray *womensArray;
}

@end

@implementation EventsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        //Set BackButton Background
        //UIImage *backButtonImage = [[UIImage imageNamed:@"BackButton.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 13, 0, 6)];
        //[[UIBarButtonItem appearance]setBackButtonBackgroundImage:backButtonImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
       // [self.navigationController.navigationItem.backBarButtonItem setBackButtonBackgroundImage:backButtonImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    mensArray =[[NSArray alloc]initWithArray:[self.events objectForKey:@"Mens"]];
    womensArray =[[NSArray alloc]initWithArray:[self.events objectForKey:@"Womens"]];
    
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.frame];
    [imageView setImage:[UIImage imageNamed:@"Background"]];
    imageView.alpha = .7;
    self.tableView.backgroundView = imageView;
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if(section==0)
        return @"Men's Events";
    else
        return @"Women's Events";
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (section==0) {
        return mensArray.count;
    }
    else
        return womensArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    if (indexPath.section==0) {
        cell.textLabel.text = [[mensArray objectAtIndex:indexPath.row]objectForKey:@"Name"];
    }
    else{
        cell.textLabel.text = [[womensArray objectAtIndex:indexPath.row]objectForKey:@"Name"];

    }
    return cell;
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"DetailViewController"]) {
        DetailViewController *DVC = [segue destinationViewController];
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        if (indexPath.section==0) {
            [DVC setRuleString:[[mensArray objectAtIndex:indexPath.row]objectForKey:@"Rules"]];
            [DVC setDescriptionString:[[mensArray objectAtIndex:indexPath.row]objectForKey:@"Description"]];
            NSString *string = [NSString stringWithFormat:@"Men's %@",[[mensArray objectAtIndex:indexPath.row]objectForKey:@"Name"]];
            [DVC setNameString:string];

        }
        else{
            [DVC setRuleString:[[womensArray objectAtIndex:indexPath.row]objectForKey:@"Rules"]];
            [DVC setDescriptionString:[[womensArray objectAtIndex:indexPath.row]objectForKey:@"Description"]];
            NSString *string = [NSString stringWithFormat:@"Women's %@",[[womensArray objectAtIndex:indexPath.row]objectForKey:@"Name"]];
            [DVC setNameString:string];
        }
        
    }
}








- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
