//
//  ViewController.m
//  KeepWorksTask
//
//  Created by Satish on 11/2/16.
//  Copyright © 2016 Satish. All rights reserved.
//

#import "ViewController.h"
#import "EventsListViewController.h"
#import "ContentManager.h"

@interface ViewController ()
- (IBAction)loginButtonAction:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationController.title=@"List";
    //[self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginButtonAction:(id)sender {
    
    if (_nameTextField.text && _nameTextField.text.length > 0)
    {
        UIStoryboard *storyBoardObject = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        EventsListViewController * eventsListViewControllerObject = [storyBoardObject instantiateViewControllerWithIdentifier:@"EventsListViewControllerID"];
        [[ContentManager contentSharedManager] getAllEventsData];
        [self.navigationController pushViewController:eventsListViewControllerObject animated:YES];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Enter Name"
                                                        message:@"Please Enter Name"
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];    }
    

}
@end
