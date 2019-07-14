//
//  WKViewController.m
//  WKRefresh
//
//  Created by 王承权 on 07/14/2019.
//  Copyright (c) 2019 王承权. All rights reserved.
//

#import "WKViewController.h"

@interface WKViewController ()

@property (nonatomic, strong) UIImageView *loadingView;

@property (nonatomic, assign) BOOL isPlaying;

@end

@implementation WKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
      self.loadingView = [[UIImageView alloc]initWithFrame:CGRectMake(150, 300, 50, 50)];
        self.loadingView.image = [UIImage imageNamed:@"con_ic_ending"];
        [self.view addSubview:self.loadingView];
}

- (void)viewWillAppear:(BOOL)animated {
    [self play];
    self.isPlaying = YES;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (self.isPlaying) {
        [self stop];
    } else {
        [self play];
    }
    self.isPlaying = !self.isPlaying;
}

- (void)play {
    CABasicAnimation* rotationAnimation;
        rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 0.5 ];
        rotationAnimation.duration = 0.4;
        rotationAnimation.cumulative = YES;
        rotationAnimation.repeatCount = MAXFLOAT;
        [self.loadingView.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];//开始动画
}

- (void)stop {
    [self.loadingView.layer removeAnimationForKey:@"rotationAnimation"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
