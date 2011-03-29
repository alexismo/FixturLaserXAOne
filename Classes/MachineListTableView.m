//
//  MachineListTableView.m
//  fixturIPhone
//
//  Created by Alexis Morin on 12/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MachineListTableView.h"
#import "Machine.h"

@interface MachineListTableView()
@property (retain) NSArray *machines;
@property (retain) NSArray *sections;
@end


@implementation MachineListTableView

@synthesize machines, sections;

- (NSArray *)machines{
	if(!machines){
		//initialize all the machines here
		Machine *mac1 = [[Machine alloc] initWithName:@"UID Storebro" 
											  withRPM:3500 
										 withLocation:@"UID, Umeå" 
									withLastAlignment:@"8 Months Ago"];
		
		Machine *mac2 = [[Machine alloc] initWithName:@"Water Pump X3" 
											  withRPM:4500 
										 withLocation:@"Umeå Energie, Umeå" 
									withLastAlignment:@"3 Weeks Ago"];
		
		Machine *mac3 = [[Machine alloc] initWithName:@"Turbine W600" 
											  withRPM:7000 
										 withLocation:@"FixturLaser AB, Mölndal" 
									withLastAlignment:@"4 Months Ago"];
		
		Machine *mac4 = [[Machine alloc] initWithName:@"Turbine Z950" 
											  withRPM:8000 
										 withLocation:@"FixturLaser AB, Mölndal" 
									withLastAlignment:@"5 Months Ago"];

		NSArray *currLocMachines = [NSArray arrayWithObjects:mac1, mac2, nil];
		NSArray *otherLocMachines = [NSArray arrayWithObjects:mac3, mac4, nil];
		
		machines = [NSArray arrayWithObjects:currLocMachines, otherLocMachines, nil];
		
		[mac1 release]; [mac2 release]; [mac3 release]; [mac4 release];		
	}
	return machines;
}

- (NSArray *)sections{
	if (!sections){
		sections = [[NSArray arrayWithObjects:@"Current Location", @"Other Locations", nil] retain];
	}
	return sections;
}

#pragma mark -
#pragma mark Initialization

/*
- (id)initWithStyle:(UITableViewStyle)style {
    // Override initWithStyle: if you create the controller programmatically and want to 
	//perform customization that is not appropriate for viewDidLoad.
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/


#pragma mark -
#pragma mark View lifecycle

/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}
*/
/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    
	return self.sections.count;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
	NSArray *machinesInSection = [self.machines objectAtIndex:section];
    return machinesInSection.count;
}

- (Machine *)machineAtIndexPath:(NSIndexPath *)indexPath{
	//no allocation, fckyeah
	//NSArray *machinesForSection = [self.machines objectForKey:[self.sections objectAtIndex:indexPath.section]];
	//return [[[self.machines objectForKey:[self.sections objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row] autorelease];
	return [[self.machines objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"MachineCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
		
		Machine *tempMachine = [self machineAtIndexPath:indexPath];
		
		cell.textLabel.text = [NSString stringWithFormat:@"%@", tempMachine.name];
		cell.detailTextLabel.text = [NSString stringWithFormat:@"Last Aligned: %@", tempMachine.lastAligned];
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    // Configure the cell...
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
	return [self.sections objectAtIndex:section];
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
    /*
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
    [detailViewController release];
    */
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
	[machines release];
	[sections release];
    [super dealloc];
}


@end

