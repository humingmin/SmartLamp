//
// ATAnimationView.h
// Generated by Core Animator version 1.3.1 on 2016-08-05.
//
// DO NOT MODIFY THIS FILE. IT IS AUTO-GENERATED AND WILL BE OVERWRITTEN
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
IB_DESIGNABLE
@interface ATAnimationView : UIView

@property (strong, nonatomic) NSDictionary *viewsByName;

// scanAnimation
- (void)addScanAnimation;
- (void)addScanAnimationWithCompletion:(void (^)(BOOL finished))completionBlock;
- (void)addScanAnimationAndRemoveOnCompletion:(BOOL)removedOnCompletion;
- (void)addScanAnimationAndRemoveOnCompletion:(BOOL)removedOnCompletion completion:(void (^)(BOOL finished))completionBlock;
- (void)addScanAnimationWithBeginTime:(CFTimeInterval)beginTime andFillMode:(NSString *)fillMode andRemoveOnCompletion:(BOOL)removedOnCompletion completion:(void (^)(BOOL finished))completionBlock;
- (void)removeScanAnimation;

- (void)removeAllAnimations;

@end
