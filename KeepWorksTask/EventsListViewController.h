//
//  EventsListViewController.h
//  KeepWorksTask
//
//  Created by Satish on 11/2/16.
//  Copyright © 2016 Satish. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventsListViewController : UIViewController
- (IBAction)showListButtonAction:(id)sender;
- (IBAction)showGridViewButtonAction:(id)sender;

@property (weak, nonatomic)NSMutableArray *eventNameArray;
@property (weak, nonatomic)NSMutableArray *eventLocationArray;
@property (weak, nonatomic)NSMutableArray *eventThumbnailArray;

@end
