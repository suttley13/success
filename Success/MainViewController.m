//
//  MainViewController.m
//  Success
//
//  Created by Uttley, Spencer on 8/19/14.
//  Copyright (c) 2014 SpencerUttley. All rights reserved.
//





#import "MainViewController.h"
#import "JNWSpringAnimation.h"

@interface MainViewController ()
- (IBAction)refreshButton:(id)sender;
- (IBAction)sendButton:(id)sender;
- (IBAction)sendListBackButton:(id)sender;
- (IBAction)sendListAddFriendButton:(id)sender;

- (IBAction)settingsGenderSwitch:(id)sender;
- (IBAction)settingsView:(id)sender;
- (IBAction)settingsBackButton:(id)sender;

- (IBAction)launchInbox:(id)sender;
- (IBAction)inboxBackButton:(id)sender;

- (IBAction)recieved:(id)sender;
- (IBAction)compareBackButton:(id)sender;

@end

@implementation MainViewController

int personOneCounter = 0;
int personTwoCounter = 0;
int personThreeCounter = 0;
int previousTreeo = 0;
int genderCounter = 0;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [sendListView setAlpha:0];
    [settingsView setAlpha:0];
    [compareView setAlpha:0];
    [inboxView setAlpha:0];
    leftSideLabel.text = @"Swipe To Choose";

   hateLabel.textColor = [UIColor colorWithRed:(94/255.0) green:(213/255.0) blue:(238/255.0) alpha:1] ;
   mateLabel.textColor = [UIColor colorWithRed:(208/255.0) green:(69/255.0) blue:(206/255.0) alpha:1] ;
   dateLabel.textColor = [UIColor colorWithRed:(234/255.0) green:(62/255.0) blue:(81/255.0) alpha:1] ;
    
    [sendButtonOutlet setAlpha: 0];

    
    [friendListScroller setScrollEnabled:YES];
    [friendListScroller setContentSize:CGSizeMake(320, 1400)];

    /////////// Create Gesture Regognizers /////////////
    
    [personOneImage setUserInteractionEnabled:YES];
    [personTwoImage setUserInteractionEnabled:YES];
    [personThreeImage setUserInteractionEnabled:YES];
    
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    UISwipeGestureRecognizer *swipeUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    
    UISwipeGestureRecognizer *swipeLeft2 = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe2:)];
    UISwipeGestureRecognizer *swipeRight2 = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe2:)];
    UISwipeGestureRecognizer *swipeUp2 = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe2:)];
    
    UISwipeGestureRecognizer *swipeLeft3 = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe3:)];
    UISwipeGestureRecognizer *swipeRight3 = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe3:)];
    UISwipeGestureRecognizer *swipeUp3 = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe3:)];
    
    // Setting the swipe direction.
    [swipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    [swipeRight setDirection:UISwipeGestureRecognizerDirectionRight];
    [swipeUp setDirection:UISwipeGestureRecognizerDirectionUp];
    
    [swipeLeft2 setDirection:UISwipeGestureRecognizerDirectionLeft];
    [swipeRight2 setDirection:UISwipeGestureRecognizerDirectionRight];
    [swipeUp2 setDirection:UISwipeGestureRecognizerDirectionUp];
    
    [swipeLeft3 setDirection:UISwipeGestureRecognizerDirectionLeft];
    [swipeRight3 setDirection:UISwipeGestureRecognizerDirectionRight];
    [swipeUp3 setDirection:UISwipeGestureRecognizerDirectionUp];
    
    // Adding the swipe gesture on image view
    [personOneImage addGestureRecognizer:swipeLeft];
    [personOneImage addGestureRecognizer:swipeRight];
    [personOneImage addGestureRecognizer:swipeUp];
    
    [personTwoImage addGestureRecognizer:swipeLeft2];
    [personTwoImage addGestureRecognizer:swipeRight2];
    [personTwoImage addGestureRecognizer:swipeUp2];
    
    [personThreeImage addGestureRecognizer:swipeLeft3];
    [personThreeImage addGestureRecognizer:swipeRight3];
    [personThreeImage addGestureRecognizer:swipeUp3];
    
    
    CALayer *imageLayer = personOneImage.layer;
    [imageLayer setCornerRadius:45];
    [imageLayer setBorderWidth:0];
    [imageLayer setMasksToBounds:YES];
    
    CALayer *imageLayer2 = personTwoImage.layer;
    [imageLayer2 setCornerRadius:45];
    [imageLayer2 setBorderWidth:0];
    [imageLayer2 setMasksToBounds:YES];
    
    CALayer *imageLayer3 = personThreeImage.layer;
    [imageLayer3 setCornerRadius:45];
    [imageLayer3 setBorderWidth:0];
    [imageLayer3 setMasksToBounds:YES];
    
    CALayer *imageLayer4 = youCompareImageOne.layer;
    [imageLayer4 setCornerRadius:45];
    [imageLayer4 setBorderWidth:0];
    [imageLayer4 setMasksToBounds:YES];
    
    CALayer *imageLayer5 = youCompareImageTwo.layer;
    [imageLayer5 setCornerRadius:45];
    [imageLayer5 setBorderWidth:0];
    [imageLayer5 setMasksToBounds:YES];
    
    CALayer *imageLayer6 = youCompareImageThree.layer;
    [imageLayer6 setCornerRadius:45];
    [imageLayer6 setBorderWidth:0];
    [imageLayer6 setMasksToBounds:YES];
    
    CALayer *imageLayer7 = themCompareImageOne.layer;
    [imageLayer7 setCornerRadius:45];
    [imageLayer7 setBorderWidth:0];
    [imageLayer7 setMasksToBounds:YES];
    
    CALayer *imageLayer8 = themCompareImageTwo.layer;
    [imageLayer8 setCornerRadius:45];
    [imageLayer8 setBorderWidth:0];
    [imageLayer8 setMasksToBounds:YES];

    CALayer *imageLayer9 = themCompareImageThree.layer;
    [imageLayer9 setCornerRadius:45];
    [imageLayer9 setBorderWidth:0];
    [imageLayer9 setMasksToBounds:YES];

    
  
    inboxOutbox = [NSArray arrayWithObjects:@"Jack Dean", @"Benton Uttley", @"Brady Van De Hey", @"Jack Dean", @"Chase Uttley", nil];
    
    
    int randomNumber = (arc4random() % 4);
    
    switch (randomNumber) {
        case 0:
            [self treeoOne];
            break;
        case 1:
            [self treeoTwo];
            break;
        case 2:
            [self treeoThree];
            break;
        case 3:
            [self treeoFour];
            break;
            
        default:
            break;
    }

    
    
}


/////////////////// Handle Swipes For Person One ////////////////////
- (void)handleSwipe:(UISwipeGestureRecognizer *)swipe {
    
    leftSideLabel.text = @"";
    ////// make name label white /////////
    personOneNameLabel.textColor = [UIColor whiteColor];
    
    if (swipe.direction == UISwipeGestureRecognizerDirectionLeft) {
        
        //////// Animate ////////////
        personOneImage.transform = CGAffineTransformMakeTranslation(0, 0);
        [UIView animateWithDuration:0.9 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0 options:0 animations:^{
            personOneImage.transform = CGAffineTransformMakeTranslation(-60, 0);
        } completion:NULL];
        
        personOneImage.transform = CGAffineTransformMakeTranslation(-60, 0);
        [UIView animateWithDuration:0.9 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0 options:0 animations:^{
            personOneImage.transform = CGAffineTransformMakeTranslation(0, 0);
        } completion:NULL];
        
        /////////// Set shit to match swipe////////////
        UIImage *image = [UIImage imageNamed: @"hate check.png"];
        [leftTopCirlce setImage: image];
        
        UIImage *image2 = [UIImage imageNamed: @"Blue Hate.png"];
        [swooshImageOne setImage: image2];
        
        choiceLabelOne.text = @"Hate";
        
        
        
        ///////// Handle the overlap cases /////////////
        if (personOneCounter == 2){
            UIImage *image = [UIImage imageNamed: @"Up Arrow Circle.png"];
            [upTopCircle setImage: image];
        }
        
        if (personOneCounter == 3){
            UIImage *image = [UIImage imageNamed: @"Right Arrow Circle.png"];
            [rightTopCircle setImage: image];
        }
        
        if (personTwoCounter == 1) {
            UIImage *image2 = [UIImage imageNamed: @""];
            [swooshImageTwo setImage: image2];
            
            choiceLabelTwo.text = @"";
            personTwoNameLabel.textColor = [UIColor blackColor];
            personTwoCounter = 0;
            
        }
        if (personThreeCounter == 1) {
            UIImage *image2 = [UIImage imageNamed: @""];
            [swooshImageThree setImage: image2];
            
            choiceLabelThree.text = @"";
            personThreeNameLabel.textColor = [UIColor blackColor];
            personThreeCounter = 0;
            
        }
        
        personOneCounter = 1;
        
        if (personOneCounter != 0 && personTwoCounter != 0 && personThreeCounter != 0 ){
            [self createSendButton];
        }else {
            [self killSendButton];
        }


    }
    
    if (swipe.direction == UISwipeGestureRecognizerDirectionUp) {
        
        //////// Animate ////////////
        personOneImage.transform = CGAffineTransformMakeTranslation(0, 0);
        [UIView animateWithDuration:0.9 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0 options:0 animations:^{
            personOneImage.transform = CGAffineTransformMakeTranslation(0, -60);
        } completion:NULL];
        
        personOneImage.transform = CGAffineTransformMakeTranslation(0, -60);
        [UIView animateWithDuration:0.9 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0 options:0 animations:^{
            personOneImage.transform = CGAffineTransformMakeTranslation(0, 0);
        } completion:NULL];
        
        
        /////////// Set shit to match swipe////////////
        UIImage *image = [UIImage imageNamed: @"mate check.png"];
        [upTopCircle setImage: image];
        
        UIImage *image2 = [UIImage imageNamed: @"Purple Mate.png"];
        [swooshImageOne setImage: image2];
        
        choiceLabelOne.text = @"Mate";
        
        ///////// Handle the overlap cases /////////////
        if (personOneCounter == 1){
            UIImage *image = [UIImage imageNamed: @"Left Arrow Circle.png"];
            [leftTopCirlce setImage: image];
        }
        
        if (personOneCounter == 3){
            UIImage *image = [UIImage imageNamed: @"Right Arrow Circle.png"];
            [rightTopCircle setImage: image];
        }
        
        if (personTwoCounter == 2) {
            UIImage *image2 = [UIImage imageNamed: @""];
            [swooshImageTwo setImage: image2];
            
            choiceLabelTwo.text = @"";
            personTwoNameLabel.textColor = [UIColor blackColor];
            personTwoCounter = 0;
            
        }
        if (personThreeCounter == 2) {
            UIImage *image2 = [UIImage imageNamed: @""];
            [swooshImageThree setImage: image2];
            
            choiceLabelThree.text = @"";
            personThreeNameLabel.textColor = [UIColor blackColor];
            personThreeCounter = 0;
            
        }
        
        personOneCounter = 2;

        if (personOneCounter != 0 && personTwoCounter != 0 && personThreeCounter != 0 ){
            [self createSendButton];
        }else {
            [self killSendButton];
        }

        
    }
    
    if (swipe.direction == UISwipeGestureRecognizerDirectionRight) {
        
        //////// Animate ////////////
        personOneImage.transform = CGAffineTransformMakeTranslation(0, 0);
        [UIView animateWithDuration:0.9 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0 options:0 animations:^{
            personOneImage.transform = CGAffineTransformMakeTranslation(60, 0);
        } completion:NULL];
        
        personOneImage.transform = CGAffineTransformMakeTranslation(60, 0);
        [UIView animateWithDuration:0.9 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0 options:0 animations:^{
            personOneImage.transform = CGAffineTransformMakeTranslation(0, 0);
        } completion:NULL];
        
        
        /////////// Set shit to match swipe////////////
        UIImage *image = [UIImage imageNamed: @"date check.png"];
        [rightTopCircle setImage: image];
        
        UIImage *image2 = [UIImage imageNamed: @"Red Date.png"];
        [swooshImageOne setImage: image2];
        
        choiceLabelOne.text = @"Date";
        
        ///////// Handle the overlap cases /////////////
        if (personOneCounter == 1){
            UIImage *image = [UIImage imageNamed: @"Left Arrow Circle.png"];
            [leftTopCirlce setImage: image];
        }
        
        if (personOneCounter == 2){
            UIImage *image = [UIImage imageNamed: @"Up Arrow Circle.png"];
            [upTopCircle setImage: image];
        }
        
        if (personTwoCounter == 3) {
            UIImage *image2 = [UIImage imageNamed: @""];
            [swooshImageTwo setImage: image2];
            
            choiceLabelTwo.text = @"";
            personTwoNameLabel.textColor = [UIColor blackColor];
            personTwoCounter = 0;
            
        }
        if (personThreeCounter == 3) {
            UIImage *image2 = [UIImage imageNamed: @""];
            [swooshImageThree setImage: image2];
            
            choiceLabelThree.text = @"";
            personThreeNameLabel.textColor = [UIColor blackColor];
            personThreeCounter = 0;
            
        }
        
        personOneCounter = 3;
        
        if (personOneCounter != 0 && personTwoCounter != 0 && personThreeCounter != 0 ){
            [self createSendButton];
        }else {
            [self killSendButton];
        }

        
    }

    
}

/////////////////// Handle Swipes For Person Two ////////////////////
- (void)handleSwipe2:(UISwipeGestureRecognizer *)swipe2 {
    
    leftSideLabel.text = @"";
    
    personTwoNameLabel.textColor = [UIColor whiteColor];
    
    if (swipe2.direction == UISwipeGestureRecognizerDirectionLeft) {
        
        //////// Animate ////////////
        personTwoImage.transform = CGAffineTransformMakeTranslation(0, 0);
        [UIView animateWithDuration:0.9 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0 options:0 animations:^{
            personTwoImage.transform = CGAffineTransformMakeTranslation(-60, 0);
        } completion:NULL];
        
        personTwoImage.transform = CGAffineTransformMakeTranslation(-60, 0);
        [UIView animateWithDuration:0.9 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0 options:0 animations:^{
            personTwoImage.transform = CGAffineTransformMakeTranslation(0, 0);
        } completion:NULL];
        
        
        /////////// Set shit to match swipe////////////
        UIImage *image = [UIImage imageNamed: @"hate check.png"];
        [leftTopCirlce setImage: image];
        
        UIImage *image2 = [UIImage imageNamed: @"Blue Hate.png"];
        [swooshImageTwo setImage: image2];
        
        choiceLabelTwo.text = @"Hate";
        
        ///////// Handle the overlap cases /////////////
        if (personTwoCounter == 2){
            UIImage *image = [UIImage imageNamed: @"Up Arrow Circle.png"];
            [upTopCircle setImage: image];
        }
        
        if (personTwoCounter == 3){
            UIImage *image = [UIImage imageNamed: @"Right Arrow Circle.png"];
            [rightTopCircle setImage: image];
        }
        
        if (personOneCounter == 1) {
            UIImage *image2 = [UIImage imageNamed: @""];
            [swooshImageOne setImage: image2];
            
            choiceLabelOne.text = @"";
            personOneNameLabel.textColor = [UIColor blackColor];
            personOneCounter = 0;
            
        }
        if (personThreeCounter == 1) {
            UIImage *image2 = [UIImage imageNamed: @""];
            [swooshImageThree setImage: image2];
            
            choiceLabelThree.text = @"";
            personThreeNameLabel.textColor = [UIColor blackColor];
            personThreeCounter = 0;
            
        }
        
        personTwoCounter = 1;

        if (personOneCounter != 0 && personTwoCounter != 0 && personThreeCounter != 0 ){
            [self createSendButton];
        }else {
            [self killSendButton];
        }

    }
    
    if (swipe2.direction == UISwipeGestureRecognizerDirectionUp) {
        
        
        
        //////// Animate ////////////
        personTwoImage.transform = CGAffineTransformMakeTranslation(0, 0);
        [UIView animateWithDuration:0.9 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0 options:0 animations:^{
            personTwoImage.transform = CGAffineTransformMakeTranslation(0, -60);
        } completion:NULL];
        
        personTwoImage.transform = CGAffineTransformMakeTranslation(0, -60);
        [UIView animateWithDuration:0.9 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0 options:0 animations:^{
            personTwoImage.transform = CGAffineTransformMakeTranslation(0, 0);
        } completion:NULL];
        
        
        /////////// Set shit to match swipe////////////
        UIImage *image = [UIImage imageNamed: @"mate check.png"];
        [upTopCircle setImage: image];
        
        UIImage *image2 = [UIImage imageNamed: @"Purple Mate.png"];
        [swooshImageTwo setImage: image2];
        
        choiceLabelTwo.text = @"Mate";
        
        ///////// Handle the overlap cases /////////////
        if (personTwoCounter == 1){
            UIImage *image = [UIImage imageNamed: @"Left Arrow Circle.png"];
            [leftTopCirlce setImage: image];
        }
        
        if (personTwoCounter == 3){
            UIImage *image = [UIImage imageNamed: @"Right Arrow Circle.png"];
            [rightTopCircle setImage: image];
        }
        
        if (personOneCounter == 2) {
            UIImage *image2 = [UIImage imageNamed: @""];
            [swooshImageOne setImage: image2];
            
            choiceLabelOne.text = @"";
            personOneNameLabel.textColor = [UIColor blackColor];
            personOneCounter = 0;
            
        }
        if (personThreeCounter == 2) {
            UIImage *image2 = [UIImage imageNamed: @""];
            [swooshImageThree setImage: image2];
            
            choiceLabelThree.text = @"";
            personThreeNameLabel.textColor = [UIColor blackColor];
            personThreeCounter = 0;
            
        }
        
        personTwoCounter = 2;

        if (personOneCounter != 0 && personTwoCounter != 0 && personThreeCounter != 0 ){
            [self createSendButton];
        }else {
            [self killSendButton];
        }

    }
    
    if (swipe2.direction == UISwipeGestureRecognizerDirectionRight) {
        
        //////// Animate ////////////
        personTwoImage.transform = CGAffineTransformMakeTranslation(0, 0);
        [UIView animateWithDuration:0.9 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0 options:0 animations:^{
            personTwoImage.transform = CGAffineTransformMakeTranslation(60, 0);
        } completion:NULL];
        
        personTwoImage.transform = CGAffineTransformMakeTranslation(60, 0);
        [UIView animateWithDuration:0.9 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0 options:0 animations:^{
            personTwoImage.transform = CGAffineTransformMakeTranslation(0, 0);
        } completion:NULL];
        
        
        /////////// Set shit to match swipe////////////
        UIImage *image = [UIImage imageNamed: @"date check.png"];
        [rightTopCircle setImage: image];
        
        UIImage *image2 = [UIImage imageNamed: @"Red Date.png"];
        [swooshImageTwo setImage: image2];
        
        choiceLabelTwo.text = @"Date";
        
        ///////// Handle the overlap cases /////////////
        if (personTwoCounter == 1){
            UIImage *image = [UIImage imageNamed: @"Left Arrow Circle.png"];
            [leftTopCirlce setImage: image];
        }
        
        if (personTwoCounter == 2){
            UIImage *image = [UIImage imageNamed: @"Up Arrow Circle.png"];
            [upTopCircle setImage: image];
        }
        
        if (personOneCounter == 3) {
            UIImage *image2 = [UIImage imageNamed: @""];
            [swooshImageOne setImage: image2];
            
            choiceLabelOne.text = @"";
            personOneNameLabel.textColor = [UIColor blackColor];
            personOneCounter = 0;
            
        }
        if (personThreeCounter == 3) {
            UIImage *image2 = [UIImage imageNamed: @""];
            [swooshImageThree setImage: image2];
            
            choiceLabelThree.text = @"";
            personThreeNameLabel.textColor = [UIColor blackColor];
            personThreeCounter = 0;
            
        }
          personTwoCounter = 3;

        if (personOneCounter != 0 && personTwoCounter != 0 && personThreeCounter != 0 ){
            [self createSendButton];
        }else {
            [self killSendButton];
        }

        
    }
    
    
}

/////////////////// Handle Swipes For Person One ////////////////////
- (void)handleSwipe3:(UISwipeGestureRecognizer *)swipe3 {
    
    leftSideLabel.text = @"";
    personThreeNameLabel.textColor = [UIColor whiteColor];
    
    if (swipe3.direction == UISwipeGestureRecognizerDirectionLeft) {
        
        //////// Animate ////////////
        personThreeImage.transform = CGAffineTransformMakeTranslation(0, 0);
        [UIView animateWithDuration:0.9 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0 options:0 animations:^{
            personThreeImage.transform = CGAffineTransformMakeTranslation(-60, 0);
        } completion:NULL];
        
        personThreeImage.transform = CGAffineTransformMakeTranslation(-60, 0);
        [UIView animateWithDuration:0.9 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0 options:0 animations:^{
            personThreeImage.transform = CGAffineTransformMakeTranslation(0, 0);
        } completion:NULL];
        
        
        /////////// Set shit to match swipe////////////
        UIImage *image = [UIImage imageNamed: @"hate check.png"];
        [leftTopCirlce setImage: image];
        
        UIImage *image2 = [UIImage imageNamed: @"Blue Hate.png"];
        [swooshImageThree setImage: image2];
        
          choiceLabelThree.text = @"Hate";
        
        ///////// Handle the overlap cases /////////////
        if (personThreeCounter == 2){
            UIImage *image = [UIImage imageNamed: @"Up Arrow Circle.png"];
            [upTopCircle setImage: image];
        }
        
        if (personThreeCounter == 3){
            UIImage *image = [UIImage imageNamed: @"Right Arrow Circle.png"];
            [rightTopCircle setImage: image];
        }
        
        if (personOneCounter == 1) {
            UIImage *image2 = [UIImage imageNamed: @""];
            [swooshImageOne setImage: image2];
            
            choiceLabelOne.text = @"";
            personOneNameLabel.textColor = [UIColor blackColor];
            personOneCounter = 0;
            
        }
        if (personTwoCounter == 1) {
            UIImage *image2 = [UIImage imageNamed: @""];
            [swooshImageTwo setImage: image2];
            
            choiceLabelTwo.text = @"";
            personTwoNameLabel.textColor = [UIColor blackColor];
            personTwoCounter = 0;
            
        }
        personThreeCounter = 1;

        if (personOneCounter != 0 && personTwoCounter != 0 && personThreeCounter != 0 ){
            [self createSendButton];
        }else {
            [self killSendButton];
        }

        
    }
    
    if (swipe3.direction == UISwipeGestureRecognizerDirectionUp) {
        
        //////// Animate ////////////
        personThreeImage.transform = CGAffineTransformMakeTranslation(0, 0);
        [UIView animateWithDuration:0.9 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0 options:0 animations:^{
            personThreeImage.transform = CGAffineTransformMakeTranslation(0, -60);
        } completion:NULL];
        
        personThreeImage.transform = CGAffineTransformMakeTranslation(0, -60);
        [UIView animateWithDuration:0.9 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0 options:0 animations:^{
            personThreeImage.transform = CGAffineTransformMakeTranslation(0, 0);
        } completion:NULL];
        
        
        /////////// Set shit to match swipe////////////
        UIImage *image = [UIImage imageNamed: @"mate check.png"];
        [upTopCircle setImage: image];
        
        UIImage *image2 = [UIImage imageNamed: @"Purple Mate.png"];
        [swooshImageThree setImage: image2];
        
         choiceLabelThree.text = @"Mate";
        
        ///////// Handle the overlap cases /////////////
        if (personThreeCounter == 1){
            UIImage *image = [UIImage imageNamed: @"Left Arrow Circle.png"];
            [leftTopCirlce setImage: image];
        }
        
        if (personThreeCounter == 3){
            UIImage *image = [UIImage imageNamed: @"Right Arrow Circle.png"];
            [rightTopCircle setImage: image];
        }
        
        if (personOneCounter == 2) {
            UIImage *image2 = [UIImage imageNamed: @""];
            [swooshImageOne setImage: image2];
            
            choiceLabelOne.text = @"";
            personOneNameLabel.textColor = [UIColor blackColor];
            personOneCounter = 0;
            
        }
        if (personTwoCounter == 2) {
            UIImage *image2 = [UIImage imageNamed: @""];
            [swooshImageTwo setImage: image2];
            
            choiceLabelTwo.text = @"";
            personTwoNameLabel.textColor = [UIColor blackColor];
            personTwoCounter = 0;
            
        }
        personThreeCounter = 2;
        
        if (personOneCounter != 0 && personTwoCounter != 0 && personThreeCounter != 0 ){
            [self createSendButton];
        }else {
            [self killSendButton];
        }

        
    }
    
    if (swipe3.direction == UISwipeGestureRecognizerDirectionRight) {
        
        //////// Animate ////////////
        personThreeImage.transform = CGAffineTransformMakeTranslation(0, 0);
        [UIView animateWithDuration:0.9 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0 options:0 animations:^{
            personThreeImage.transform = CGAffineTransformMakeTranslation(60, 0);
        } completion:NULL];
        
        personThreeImage.transform = CGAffineTransformMakeTranslation(60, 0);
        [UIView animateWithDuration:0.9 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0 options:0 animations:^{
            personThreeImage.transform = CGAffineTransformMakeTranslation(0, 0);
        } completion:NULL];
        
        
        /////////// Set shit to match swipe////////////
        UIImage *image = [UIImage imageNamed: @"date check.png"];
        [rightTopCircle setImage: image];
        
        UIImage *image2 = [UIImage imageNamed: @"Red Date.png"];
        [swooshImageThree setImage: image2];
        
        choiceLabelThree.text = @"Date";
        
        ///////// Handle the overlap cases /////////////
        if (personThreeCounter == 1){
            UIImage *image = [UIImage imageNamed: @"Left Arrow Circle.png"];
            [leftTopCirlce setImage: image];
        }
        
        if (personThreeCounter == 2){
            UIImage *image = [UIImage imageNamed: @"Up Arrow Circle.png"];
            [upTopCircle setImage: image];
        }
        
        if (personOneCounter == 3) {
            UIImage *image2 = [UIImage imageNamed: @""];
            [swooshImageOne setImage: image2];
            
            choiceLabelOne.text = @"";
            personOneNameLabel.textColor = [UIColor blackColor];
            personOneCounter = 0;
            
        }
        if (personTwoCounter == 3) {
            UIImage *image2 = [UIImage imageNamed: @""];
            [swooshImageTwo setImage: image2];
            
            choiceLabelTwo.text = @"";
            personTwoNameLabel.textColor = [UIColor blackColor];
            personTwoCounter = 0;
            
        }
        personThreeCounter = 3;
        
        if (personOneCounter != 0 && personTwoCounter != 0 && personThreeCounter != 0 ){
            [self createSendButton];
        }else {
            [self killSendButton];
        }
        
    }
    
    
}

- (void)treeoOne
{
    UIImage *image = [UIImage imageNamed: @"Mila Square.png"];
    [personOneImage setImage: image];
    
    personOneNameLabel.text = @"Mila Kunis";
    
    UIImage *image2 = [UIImage imageNamed: @"Emma Square.png"];
    [personTwoImage setImage: image2];
    
    personTwoNameLabel.text = @"Emma Watson";
    
    UIImage *image3 = [UIImage imageNamed: @"Jennifer Square.png"];
    [personThreeImage setImage: image3];
    
    personThreeNameLabel.text = @"Jennifer Lawrence";
    
    previousTreeo = 0;
}
- (void)treeoTwo
{
    UIImage *image = [UIImage imageNamed: @"Kate Square.png"];
    [personOneImage setImage: image];
    
    personOneNameLabel.text = @"Kate Mara";
    
    UIImage *image2 = [UIImage imageNamed: @"Elisha Square.png"];
    [personTwoImage setImage: image2];
    
    personTwoNameLabel.text = @"Elisha Cuthbert";
    
    UIImage *image3 = [UIImage imageNamed: @"Mila Square.png"];
    [personThreeImage setImage: image3];
    
    personThreeNameLabel.text = @"Mila Kunis";
    
    previousTreeo = 1;
}

- (void)treeoThree
{
    UIImage *image = [UIImage imageNamed: @"Mila Square.png"];
    [personOneImage setImage: image];
    
    personOneNameLabel.text = @"Mila Kunis";
    
    UIImage *image2 = [UIImage imageNamed: @"Emmanuelle Square.png"];
    [personTwoImage setImage: image2];
    
    personTwoNameLabel.text = @"Emmanuelle Chiriqui";
    
    UIImage *image3 = [UIImage imageNamed: @"Carla Square.png"];
    [personThreeImage setImage: image3];
    
    personThreeNameLabel.text = @"Carla Gugino";
    
    previousTreeo = 2;

}

- (void)treeoFour
{
    UIImage *image = [UIImage imageNamed: @"Katy Square.png"];
    [personOneImage setImage: image];
    
    personOneNameLabel.text = @"Katy Perry";
    
    UIImage *image2 = [UIImage imageNamed: @"Scarlett Square.png"];
    [personTwoImage setImage: image2];
    
    personTwoNameLabel.text = @"Scarlett Johansson";
    
    UIImage *image3 = [UIImage imageNamed: @"Zooey Square.png"];
    [personThreeImage setImage: image3];
    
    personThreeNameLabel.text = @"Zooey Deschanel";
    
    previousTreeo = 0;
    
}


- (IBAction)refreshButton:(id)sender {
    
    leftSideLabel.text = @"Swipe To Choose";
    
    [sendButtonOutlet setAlpha:0];
    
    personOneCounter = 0;
    personTwoCounter = 0;
    personThreeCounter = 0;
    
    ///////////Spin that shit////////
    JNWSpringAnimation *scale = [JNWSpringAnimation animationWithKeyPath:@"transform.rotation.z"];
    scale.damping = 8.42;
    scale.stiffness = 43.53;
    scale.mass = 1.54;
    scale.fromValue = @(0);
    scale.toValue = @(1.5*M_PI);
    
    [refreshButtonOutlet.layer addAnimation:scale forKey:scale.keyPath];
    refreshButtonOutlet.transform = CGAffineTransformMakeRotation(1.5*M_PI);
    
    JNWSpringAnimation *scale2 = [JNWSpringAnimation animationWithKeyPath:@"transform.rotation.z"];
    scale2.damping = 8.42;
    scale2.stiffness = 43.53;
    scale2.mass = 1.54;
    scale2.fromValue = @(0);
    scale2.toValue = @(2*M_PI);

    
    [rightTopCircle.layer addAnimation:scale2 forKey:scale2.keyPath];
    rightTopCircle.transform = CGAffineTransformMakeRotation(2*M_PI);
    
    [leftTopCirlce.layer addAnimation:scale2 forKey:scale2.keyPath];
    leftTopCirlce.transform = CGAffineTransformMakeRotation(2*M_PI);

    [upTopCircle.layer addAnimation:scale2 forKey:scale2.keyPath];
    upTopCircle.transform = CGAffineTransformMakeRotation(2*M_PI);
    
    ///////// Clear Shit /////////
    UIImage *image = [UIImage imageNamed: @"Right Arrow Circle.png"];
    [rightTopCircle setImage: image];
    
    UIImage *image2 = [UIImage imageNamed: @"Up Arrow Circle.png"];
    [upTopCircle setImage: image2];
    
    UIImage *image3 = [UIImage imageNamed: @"Left Arrow Circle.png"];
    [leftTopCirlce setImage: image3];
    
    UIImage *image4 = [UIImage imageNamed: @""];
    [swooshImageThree setImage: image4];
    
    UIImage *image5 = [UIImage imageNamed: @""];
    [swooshImageTwo setImage: image5];
    
    UIImage *image6 = [UIImage imageNamed: @""];
    [swooshImageOne setImage: image6];
    
    personOneNameLabel.textColor = [UIColor blackColor];
    personTwoNameLabel.textColor = [UIColor blackColor];
    personThreeNameLabel.textColor = [UIColor blackColor];
    
    choiceLabelOne.text = @"";
    choiceLabelTwo.text = @"";
    choiceLabelThree.text = @"";
    
    //////////// Show Random Treoo //////////
   int randomNumber = (arc4random() % 4);
    
    if(randomNumber == previousTreeo){
        randomNumber++;
    }
    
    switch (randomNumber) {
  case 0:
    [self treeoOne];
    break;
  case 1:
    [self treeoTwo];
    break;
  case 2:
    [self treeoThree];
    break;
  case 3:
    [self treeoFour];
    break;

  default:
    break;
}
    
    personOneImage.transform = CGAffineTransformMakeTranslation(0, 300);
    personOneNameLabel.transform = CGAffineTransformMakeTranslation(0, 300);
    [UIView animateWithDuration:1.0 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:0 options:0 animations:^{
        personOneImage.transform = CGAffineTransformMakeTranslation(0, 0);
        personOneNameLabel.transform = CGAffineTransformMakeTranslation(0, 0);
    } completion:NULL];
    
    personTwoImage.transform = CGAffineTransformMakeTranslation(0, 300);
    personTwoNameLabel.transform = CGAffineTransformMakeTranslation(0, 300);
    [UIView animateWithDuration:1.0 delay:.1 usingSpringWithDamping:0.6 initialSpringVelocity:0 options:0 animations:^{
        personTwoImage.transform = CGAffineTransformMakeTranslation(0, 0);
        personTwoNameLabel.transform = CGAffineTransformMakeTranslation(0, 0);
    } completion:NULL];
    
    personThreeImage.transform = CGAffineTransformMakeTranslation(0, 300);
    personThreeNameLabel.transform = CGAffineTransformMakeTranslation(0, 300);
    [UIView animateWithDuration:1.0 delay:.2 usingSpringWithDamping:0.6 initialSpringVelocity:0 options:0 animations:^{
        personThreeImage.transform = CGAffineTransformMakeTranslation(0, 0);
        personThreeNameLabel.transform = CGAffineTransformMakeTranslation(0, 0);
    } completion:NULL];

    
}

- (IBAction)sendButton:(id)sender {

    [sendListView setAlpha:1];
    [self.view bringSubviewToFront:sendListView];
    [self.view bringSubviewToFront:friendListScroller];

}

- (IBAction)sendListBackButton:(id)sender {
    [sendListView setAlpha:0];
}

- (IBAction)sendListAddFriendButton:(id)sender {
}


/// genderCounter = 0 == Ladies ////// genderCounter = 1 == dudes
- (IBAction)settingsGenderSwitch:(id)sender {
    
    NSLog(@"%@", [inboxOutbox objectAtIndex:0]);
    
    if (genderCounter == 0) {
        genderCounter++;
        
        //==========  Slide circle  ==============
        
        settingsGenderSlideCircle.transform = CGAffineTransformMakeTranslation(0, 0);
        [UIView animateWithDuration:.9 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0 options:0 animations:^{
            settingsGenderSlideCircle.transform = CGAffineTransformMakeTranslation(48, 0);
        } completion:NULL];
        
    }else if (genderCounter == 1){
         genderCounter--;

        settingsGenderSlideCircle.transform = CGAffineTransformMakeTranslation(48, 0);
        [UIView animateWithDuration:0.9 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0 options:0 animations:^{
            settingsGenderSlideCircle.transform = CGAffineTransformMakeTranslation(0, 0);
        } completion:NULL];
        
       
    }

}

- (IBAction)settingsView:(id)sender {
    [settingsView setAlpha:1];
    [self.view bringSubviewToFront:settingsView];
}

- (IBAction)settingsBackButton:(id)sender {
    
    [settingsView setAlpha:0];
}

- (IBAction)launchInbox:(id)sender {
    [inboxView setAlpha:1];
    [self.view bringSubviewToFront:inboxView];

}

- (IBAction)inboxBackButton:(id)sender {
    
    [inboxView setAlpha:0];

}

- (IBAction)recieved:(id)sender {
    
    [self launchComparisonScreen];
}

- (IBAction)compareBackButton:(id)sender {
    
    [compareView setAlpha:0];
    [inboxView setAlpha:1];
    [self.view bringSubviewToFront:inboxView];

    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)createSendButton
{
    [sendButtonOutlet setAlpha:1];
    sendButtonOutlet.transform = CGAffineTransformMakeTranslation(0, 0);
    [UIView animateWithDuration:0.9 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0 options:0 animations:^{
        sendButtonOutlet.transform = CGAffineTransformMakeTranslation(90, 0);
    } completion:NULL];
    
}

- (void)killSendButton
{
    [sendButtonOutlet setAlpha:0];
  
    
}

- (void)launchComparisonScreen
{
    [compareView setAlpha:1];
    [self.view bringSubviewToFront:compareView];
    
}






@end
