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
    //imageView.alpha = .7;
    self.tableView.backgroundView = imageView;
    
    
    
    
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    
    return 2;
}


//To show black text in grouped header
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    NSString *sectionTitle = [self tableView:tableView titleForHeaderInSection:section];
    if (sectionTitle == nil) {
        return nil;
    }
    
   
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(0, 8, 320, 20);
    label.backgroundColor = [UIColor lightTextColor];
    label.textColor = [UIColor blackColor];
    label.alpha = 0.7;
    //label.shadowColor = [UIColor grayColor];
    //label.shadowOffset = CGSizeMake(-1.0, 1.0);
    label.font = [UIFont boldSystemFontOfSize:14];
    //label.font = [UIFont fontWithName:@"ArialMT" size:15];
    label.text = sectionTitle;
    
    UIView *view = [[UIView alloc] init];
    [view addSubview:label];
    
    return view;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    tableView.backgroundColor = [UIColor lightTextColor];
    tableView.tintColor = [UIColor whiteColor];
    
    if(section==0)
        return @"Men's Events";
    else
        if ([womensArray count]>0){
        return @"Women's Events";
        }else{
            return 0;
        }
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
        
        if ([womensArray count]>0){
        cell.textLabel.text = [[womensArray objectAtIndex:indexPath.row]objectForKey:@"Name"];
        }

    }
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.textColor = [UIColor whiteColor];

    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
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
