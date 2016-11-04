//
//  ContentManager.m
//  KeepWorksTask
//
//  Created by Satish on 11/3/16.
//  Copyright © 2016 Satish. All rights reserved.
//

#import "ContentManager.h"
#import "AppDelegate.h"
#import "EventsListViewController.h"
#import "EventsList.h"

@import CoreData;
@implementation ContentManager
{
    NSMutableArray *eventsArray;
}
+ (ContentManager *) contentSharedManager {
    
    static ContentManager *sharedManager = nil;
    
    if(!sharedManager) {
        
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            sharedManager = [[super allocWithZone:NULL] init];
        });
    }
    return sharedManager;
}
- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}
-(void)saveAllEventsData{
    
    NSManagedObjectContext *context = [self managedObjectContext];

    
    NSFetchRequest *allEvents = [[NSFetchRequest alloc] init];
    [allEvents setEntity:[NSEntityDescription entityForName:@"EventsList" inManagedObjectContext:context]];
    [allEvents setIncludesPropertyValues:NO]; //only fetch the managedObjectID
    
    NSError *error = nil;
    NSArray *events = [context executeFetchRequest:allEvents error:&error];
    //error handling goes here
    for (NSManagedObject *event in events) {
        [context deleteObject:event];
    }
    NSError *saveError = nil;
    [context save:&saveError];
    
    
    
   NSMutableArray *eventNameArray=[NSMutableArray arrayWithObjects:@"Metallica Concert",@"Saree Exhibition",@"Wine tasting",@"Startups Meet",@"Summer Noon Party",@"Rock and Roll nights",@"Barbecue Fridays",@"Summer workshop",@"Impressions & Expressions",@"Italian carnival", nil];
   NSMutableArray *eventLocationArray=[NSMutableArray arrayWithObjects:@"Palace Grounds",@"Malleswaram Grounds",@"Links Brewery",@"Kanteerava Indoor Stadium",@"Kumara Park",@"Sarjapur Road",@"Whitefield",@"Indiranagar",@"MG Road",@"Electronic City", nil];
   NSMutableArray *eventThumbnailArray=[NSMutableArray arrayWithObjects:@"Metallica Concert.jpeg",@"SareeExhibition.jpeg",@"Wine tasting.jpeg",@"Startups Meet.jpeg",@"Summer Noon Party.jpeg",@"Rock and Roll nights.jpeg",@"Barbecue Fridays.jpeg",@"Summer workshop.jpeg",@"Impressions & Expressions.jpeg",@"Italian carnival.jpeg", nil];
    for (int i=0; i<eventNameArray.count; i++) {
        NSManagedObjectContext *context = [self managedObjectContext];

        EventsList *eventsListObject = [NSEntityDescription insertNewObjectForEntityForName:@"EventsList" inManagedObjectContext:context];
        eventsListObject.eventname = eventNameArray[i];
        eventsListObject.eventlocation=eventLocationArray[i];
        eventsListObject.iseventtrack=FALSE;
        UIImage *sampleimage = [UIImage imageNamed:eventThumbnailArray[i]];
        NSData *dataImage = UIImageJPEGRepresentation(sampleimage, 0.0);
        eventsListObject.eventthumbnail=dataImage;
        if (i%2==0) {
            
            eventsListObject.eventtype=@"Free";
        }
        else{
            eventsListObject.eventtype=@"Paid";
        }
    
        
        NSError *saveError = nil;
        [context save:&saveError];
    
    }
}
-(NSMutableArray *)getAllEventsData{
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"EventsList"];
    
    eventsArray = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    
    return eventsArray;
}


@end
