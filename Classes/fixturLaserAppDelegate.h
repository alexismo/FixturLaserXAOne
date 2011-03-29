//
//  fixturLaserAppDelegate.h
//  fixturLaser
//
//  Created by Alexis Morin on 12/10/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@class MachineListTableView;
@class DetailViewController;

@interface fixturLaserAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    
    UISplitViewController *splitViewController;
    
    MachineListTableView *rootViewController;
    DetailViewController *detailViewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet UISplitViewController *splitViewController;
@property (nonatomic, retain) IBOutlet MachineListTableView *rootViewController;
@property (nonatomic, retain) IBOutlet DetailViewController *detailViewController;

@end
