//
//  EventsDetailViewController.h
//  KeepWorksTask
//
//  Created by Satish on 11/2/16.
//  Copyright © 2016 Satish. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventsDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *detailEventNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailEventLocationLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailEventTypeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) NSString*eventNameString;
@property (strong, nonatomic) NSString*eventLocationString;
@property (strong, nonatomic) NSString*eventTypeString;
@property (strong, nonatomic) UIImage*eventImageObject;
@end
