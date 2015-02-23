//
//  LikesAutoDestroyView.m
//  FriendLife
//
//  Created by Ravi Vooda on 2/18/15.
//  Copyright (c) 2015 MyLikes. All rights reserved.
//

#import "LikesAutoDestroyView.h"

@interface LikesAutoDestroyView ()

@property (strong, nonatomic) NSTimer *destroyTimer;
@property (strong, atomic) timerCompleteBlock block;

@end

@implementation LikesAutoDestroyView

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

-(void) setSelfDestruct:(int)waiting withCompletionBlock:(timerCompleteBlock)timerBlock {
    if (waiting > 0) {
        @synchronized(self) {
            _destroyTimer = [NSTimer scheduledTimerWithTimeInterval:waiting target:self selector:@selector(destroy:) userInfo:timerBlock repeats:NO];
            _block = timerBlock;
        }
    } else {
        timerBlock(self);
    }
}

-(void)destroy:(timerCompleteBlock)block {
    @synchronized(self) {
        if (_destroyTimer) {
            [_destroyTimer invalidate];
            _destroyTimer = nil;
        }
        _block(self);
    }
}

@end
