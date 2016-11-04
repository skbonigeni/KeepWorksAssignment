//
//  EventsListViewController.m
//  KeepWorksTask
//
//  Created by Satish on 11/2/16.
//  Copyright © 2016 Satish. All rights reserved.
//

#import "EventsListViewController.h"
#import "EventsListCollectionViewCell.h"
#import "EventsDetailViewController.h"
#import "ContentManager.h"
#import "EventsList.h"
@import CoreData;
@interface EventsListViewController ()
{
    __weak IBOutlet UICollectionView *collectionViewObject;
    
    NSMutableArray *eventlistArray;
}
@end

@implementation EventsListViewController
int totalNumberOfCategoryItems = 10;
int totalNumberOfItemsRequiredPerRow = 2;
BOOL isGridFlowLayoutUsed=true;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   eventlistArray = [[ContentManager contentSharedManager] getAllEventsData];
    
    self.title=@"Events List";
    UINib *nibH = [UINib nibWithNibName:@"EventsListCollectionViewCell" bundle:nil];
    
    [collectionViewObject registerNib:nibH forCellWithReuseIdentifier:@"EventsListCollectionViewCellID"];
    
    [collectionViewObject reloadData];
        
    
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    
    return eventlistArray.count;
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}


- (UICollectionViewCell  *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    EventsListCollectionViewCell *cell = [collectionViewObject dequeueReusableCellWithReuseIdentifier:@"EventsListCollectionViewCellID" forIndexPath:indexPath];
    
    cell.backgroundColor=[UIColor whiteColor];
    EventsList *eventsListObject = [eventlistArray objectAtIndex:indexPath.row];
    cell.eventNameLabel.text=eventsListObject.eventname;
    cell.eventLocationLabel.text=eventsListObject.eventlocation;
    UIImage *image = [UIImage imageWithData:eventsListObject.eventthumbnail];
    [cell.eventImage setImage:image];

    if (indexPath.row%2==0) {
        cell.eventTypeLabel.text=@"Free";
    }
    else{
        cell.eventTypeLabel.text=@"Paid";
    }
    
    return cell;
    
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
        return CGSizeMake(CGRectGetWidth(self.view.frame)/totalNumberOfItemsRequiredPerRow-5,CGRectGetWidth(self.view.frame)/totalNumberOfItemsRequiredPerRow);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionView *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
    
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath

{
    UIStoryboard *storyBoardObject = [UIStoryboard storyboardWithName:@"Main" bundle:nil];

    EventsDetailViewController * eventsDetailViewControllerObject = [storyBoardObject instantiateViewControllerWithIdentifier:@"EventsDetailViewControllerID"];
    EventsList *eventsListObject = [eventlistArray objectAtIndex:indexPath.row];
    eventsDetailViewControllerObject.eventNameString=eventsListObject.eventname;
    eventsDetailViewControllerObject.eventLocationString=eventsListObject.eventlocation;
    eventsDetailViewControllerObject.eventTypeString=eventsListObject.eventtype;
    UIImage *image = [UIImage imageWithData:eventsListObject.eventthumbnail];
    eventsDetailViewControllerObject.eventImageObject=image;
    [self.navigationController pushViewController:eventsDetailViewControllerObject animated:YES];
    
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

- (IBAction)showListButtonAction:(id)sender {
    isGridFlowLayoutUsed=false;
    
    
}

- (IBAction)showGridViewButtonAction:(id)sender {
    isGridFlowLayoutUsed=true;
    
}
@end
