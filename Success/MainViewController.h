//
//  MainViewController.h
//  Success
//
//  Created by Uttley, Spencer on 8/19/14.
//  Copyright (c) 2014 SpencerUttley. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController {
    
////////////////////  Create Screen  /////////////////////////
    
    NSArray *inboxOutbox;
/////Header/////
    __weak IBOutlet UIImageView *createViewHeaderImage;

/////Body/////
    __weak IBOutlet UIImageView *leftTopCirlce;
    __weak IBOutlet UIImageView *upTopCircle;
    __weak IBOutlet UIImageView *rightTopCircle;
    
    __weak IBOutlet UIImageView *personOneImage;
    __weak IBOutlet UIImageView *personTwoImage;
    __weak IBOutlet UIImageView *personThreeImage;
    
    __weak IBOutlet UILabel *personOneNameLabel;
    __weak IBOutlet UILabel *personTwoNameLabel;
    __weak IBOutlet UILabel *personThreeNameLabel;
    
    __weak IBOutlet UIButton *refreshButtonOutlet;
    __weak IBOutlet UIButton *sendButtonOutlet;
    
    __weak IBOutlet UIImageView *swooshImageOne;
    __weak IBOutlet UIImageView *swooshImageTwo;
    __weak IBOutlet UIImageView *swooshImageThree;
    
    __weak IBOutlet UILabel *choiceLabelOne;
    __weak IBOutlet UILabel *choiceLabelTwo;
    __weak IBOutlet UILabel *choiceLabelThree;
    
    __weak IBOutlet UILabel *hateLabel;
    __weak IBOutlet UILabel *mateLabel;
    __weak IBOutlet UILabel *dateLabel;
  
    __weak IBOutlet UIView *settingsView;
    __weak IBOutlet UIView *sendListView;
    __weak IBOutlet UIScrollView *friendListScroller;
    __weak IBOutlet UILabel *leftSideLabel;
    
    __weak IBOutlet UIImageView *settingsGenderSlideCircle;
    __weak IBOutlet UIView *inboxView;
    __weak IBOutlet UIView *compareView;
    
    __weak IBOutlet UIImageView *youCompareImageOne;
    __weak IBOutlet UIImageView *youCompareImageTwo;
    __weak IBOutlet UIImageView *youCompareImageThree;
    
    __weak IBOutlet UIImageView *themCompareImageOne;
    __weak IBOutlet UIImageView *themCompareImageTwo;
    __weak IBOutlet UIImageView *themCompareImageThree;
    
    
    
}

@end
