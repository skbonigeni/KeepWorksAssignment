//
//  EventsList+CoreDataProperties.h
//  KeepWorksTask
//
//  Created by Satish on 11/3/16.
//  Copyright © 2016 Satish. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "EventsList.h"

NS_ASSUME_NONNULL_BEGIN

@interface EventsList (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *eventlocation;
@property (nullable, nonatomic, retain) NSString *eventname;
@property (nullable, nonatomic, retain) NSData *eventthumbnail;
@property (nullable, nonatomic, retain) NSString *eventtype;
@property (nullable, nonatomic, retain) NSNumber *iseventtrack;

@end

NS_ASSUME_NONNULL_END
