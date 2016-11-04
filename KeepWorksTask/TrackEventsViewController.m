//
//  TrackEventsViewController.m
//  KeepWorksTask
//
//  Created by Satish on 11/4/16.
//  Copyright © 2016 Satish. All rights reserved.
//

#import "TrackEventsViewController.h"
#import "EventsList.h"
#import "ContentManager.h"

@interface TrackEventsViewController ()
{
    NSMutableArray *eventlistArray;
}
@end

@implementation TrackEventsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    eventlistArray = [[ContentManager contentSharedManager] getAllEventsData];
    
}

-(void)filterEvents{
    for (int i=0; i<eventlistArray.count; i++) {
        EventsList *eventsListObject = [eventlistArray objectAtIndex:i];
        if (eventsListObject.iseventtrack==0){
            
        }
        else{
            
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
