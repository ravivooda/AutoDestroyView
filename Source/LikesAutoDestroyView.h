//
//  LikesAutoDestroyView.h
//  FriendLife
//
//  Created by Ravi Vooda on 2/18/15.
//  Copyright (c) 2015 MyLikes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LikesAutoDestroyView : UIView

typedef void (^timerCompleteBlock)(UIView *selfView);

-(void) setSelfDestruct:(int)waiting withCompletionBlock:(timerCompleteBlock)timerBlock;

-(void)destroy:(timerCompleteBlock)block;

@end
