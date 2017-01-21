//
// ATAnimationView.m
// Generated by Core Animator version 1.3.1 on 2016-08-05.
//
// DO NOT MODIFY THIS FILE. IT IS AUTO-GENERATED AND WILL BE OVERWRITTEN
//

#import "ATAnimationView.h"

@interface ATAnimationView ()
@property (strong, nonatomic) NSMapTable *completionBlocksByAnimation;
@end

@implementation ATAnimationView

#pragma mark - Life Cycle

- (instancetype)init
{
	return [self initWithFrame:CGRectMake(0,0,120,120)];
}

- (instancetype)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self)
	{
		[self setupHierarchy];
	}
	return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
	self = [super initWithCoder:coder];
	if (self)
	{
		[self setupHierarchy];
	}
	return self;
}

#pragma mark - Scaling

- (void)layoutSubviews
{
	[super layoutSubviews];

	UIView *scalingView = self.viewsByName[@"__scaling__"];
	float xScale = self.bounds.size.width / scalingView.bounds.size.width;
	float yScale = self.bounds.size.height / scalingView.bounds.size.height;
	switch (self.contentMode) {
		case UIViewContentModeScaleToFill:
			break;
		case UIViewContentModeScaleAspectFill:
		{
			float scale = MAX(xScale, yScale);
			xScale = scale;
			yScale = scale;
			break;
		}
		default:
		{
			float scale = MIN(xScale, yScale);
			xScale = scale;
			yScale = scale;
			break;
		}
	}
	scalingView.transform = CGAffineTransformMakeScale(xScale, yScale);
	scalingView.center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
}

#pragma mark - Setup

- (void)setupHierarchy
{
	self.completionBlocksByAnimation = [NSMapTable mapTableWithKeyOptions:NSPointerFunctionsOpaqueMemory valueOptions:NSPointerFunctionsStrongMemory];
	NSMutableDictionary *viewsByName = [NSMutableDictionary dictionary];
	NSBundle *bundle = [NSBundle bundleForClass:[self class]];

	UIView *__scaling__ = [UIView new];
	__scaling__.bounds = CGRectMake(0, 0, 120, 120);
	__scaling__.center = CGPointMake(60.0, 60.0);
	__scaling__.layer.masksToBounds = YES;
	[self addSubview:__scaling__];
	viewsByName[@"__scaling__"] = __scaling__;

	UIImageView *circle = [UIImageView new];
	circle.bounds = CGRectMake(0, 0, 120.0, 120.0);
	UIImage *imgTabbarCenterAnitmation = [UIImage imageWithContentsOfFile:[bundle pathForResource:@"tabbar_center_anitmation.png" ofType:nil]];
	if ( imgTabbarCenterAnitmation == nil ) { NSLog(@"** Warning: Could not create image from 'tabbar_center_anitmation.png'. Please make sure that it is added to the project directly (not in a folder reference)."); }
	circle.image = imgTabbarCenterAnitmation;
	circle.contentMode = UIViewContentModeCenter;
	circle.layer.position = CGPointMake(60.000, 60.000);
	[__scaling__ addSubview:circle];
	viewsByName[@"circle"] = circle;

	self.viewsByName = viewsByName;
}

#pragma mark - scanAnimation

- (void)addScanAnimation
{
	[self addScanAnimationWithBeginTime:0 andFillMode:kCAFillModeBoth andRemoveOnCompletion:NO completion:NULL];
}

- (void)addScanAnimationWithCompletion:(void (^)(BOOL finished))completionBlock
{
	[self addScanAnimationWithBeginTime:0 andFillMode:kCAFillModeBoth andRemoveOnCompletion:NO completion:completionBlock];
}

- (void)addScanAnimationAndRemoveOnCompletion:(BOOL)removedOnCompletion
{
	[self addScanAnimationWithBeginTime:0 andFillMode:removedOnCompletion ? kCAFillModeRemoved : kCAFillModeBoth andRemoveOnCompletion:removedOnCompletion completion:NULL];
}

- (void)addScanAnimationAndRemoveOnCompletion:(BOOL)removedOnCompletion completion:(void (^)(BOOL finished))completionBlock
{
	[self addScanAnimationWithBeginTime:0 andFillMode:removedOnCompletion ? kCAFillModeRemoved : kCAFillModeBoth andRemoveOnCompletion:removedOnCompletion completion:completionBlock];
}

- (void)addScanAnimationWithBeginTime:(CFTimeInterval)beginTime andFillMode:(NSString *)fillMode andRemoveOnCompletion:(BOOL)removedOnCompletion completion:(void (^)(BOOL finished))completionBlock
{
	CAMediaTimingFunction *easeInTiming = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
	CAMediaTimingFunction *easeOutTiming = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];

	if (completionBlock)
	{
		CABasicAnimation *representativeAnimation = [CABasicAnimation animationWithKeyPath:@"not.a.real.key"];
		representativeAnimation.duration = 1.500;
		representativeAnimation.delegate = self;
		[self.layer addAnimation:representativeAnimation forKey:@"ScanAnimation"];
		[self.completionBlocksByAnimation setObject:completionBlock forKey:[self.layer animationForKey:@"ScanAnimation"]];
	}

	CAKeyframeAnimation *circleRotationAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
	circleRotationAnimation.duration = 1.500;
	circleRotationAnimation.values = @[@(0.000), @(4.712), @(6.283)];
	circleRotationAnimation.keyTimes = @[@(0.000), @(0.667), @(1.000)];
	circleRotationAnimation.timingFunctions = @[easeInTiming, easeOutTiming];
	circleRotationAnimation.repeatCount = HUGE_VALF;
	circleRotationAnimation.beginTime = beginTime;
	circleRotationAnimation.fillMode = fillMode;
	circleRotationAnimation.removedOnCompletion = removedOnCompletion;
	[[self.viewsByName[@"circle"] layer] addAnimation:circleRotationAnimation forKey:@"scanAnimation_Rotation"];
}

- (void)removeScanAnimation
{
	[self.layer removeAnimationForKey:@"ScanAnimation"];
	[[self.viewsByName[@"circle"] layer] removeAnimationForKey:@"scanAnimation_Rotation"];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
	void (^completion)(BOOL) = [self.completionBlocksByAnimation objectForKey:anim];
	[self.completionBlocksByAnimation removeObjectForKey:anim];
	if (completion)
	{
		completion(flag);
	}
}

- (void)removeAllAnimations
{
	for (UIView *view in self.viewsByName.allValues)
	{
		[view.layer removeAllAnimations];
	}
	[self.layer removeAnimationForKey:@"ScanAnimation"];
}

@end
