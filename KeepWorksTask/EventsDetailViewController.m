//
//  EventsDetailViewController.m
//  KeepWorksTask
//
//  Created by Satish on 11/2/16.
//  Copyright © 2016 Satish. All rights reserved.
//

#import "EventsDetailViewController.h"
#import "TrackEventsViewController.h"

@interface EventsDetailViewController ()
- (IBAction)trackEventButtonAction:(id)sender;

@end

@implementation EventsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _detailEventNameLabel.text=_eventNameString;
    _detailEventLocationLabel.text=_eventLocationString;
    _detailEventTypeLabel.text=_eventTypeString;
    [_imageView setImage:_eventImageObject];
    self.title=@"Event Details";
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

- (IBAction)trackEventButtonAction:(id)sender {
    UIStoryboard *storyBoardObject = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    TrackEventsViewController * trackEventsViewControllerObject = [storyBoardObject instantiateViewControllerWithIdentifier:@"TrackEventsViewControllerID"];
    [self.navigationController pushViewController:trackEventsViewControllerObject animated:YES];
}
@end
