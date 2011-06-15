//
//  FirstMasterViewController.h
//  IntelligentTemplate
//
//  Created by Timothy Fazio on 15/06/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface FirstMasterViewController : UITableViewController {
    UIViewController *detailViewController;
	
}

@property (nonatomic, retain) IBOutlet UIViewController *detailViewController;

@end
