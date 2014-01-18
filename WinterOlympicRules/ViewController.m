//
//  ViewController.m
//  WinterOlympicRules
//
//  Created by Phil Scarfi on 1/17/14.
//  Copyright (c) 2014 Pioneer Mobile Applications. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    NSMutableArray *sportsArray;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    sportsArray =[[NSMutableArray alloc]initWithObjects:@"Alpine",@"Bobsled",@"Cross Country Ski", nil];
    
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
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
    
    cell.textLabel.text=[sportsArray objectAtIndex:indexPath.row];
    return cell;
}
















- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
