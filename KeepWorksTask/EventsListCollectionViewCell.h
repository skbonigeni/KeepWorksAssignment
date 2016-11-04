//
//  EventsListCollectionViewCell.h
//  KeepWorksTask
//
//  Created by Satish on 11/2/16.
//  Copyright © 2016 Satish. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventsListCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *eventNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *eventLocationLabel;
@property (weak, nonatomic) IBOutlet UILabel *eventTypeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *eventImage;

@end
