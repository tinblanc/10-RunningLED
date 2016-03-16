//
//  ViewController.m
//  RunningLED
//
//  Created by Tin Blanc on 3/15/16.
//  Copyright © 2016 Tin Blanc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    
    CGFloat _margin; // lon' hon radius ( căn lề)
    int _numberOfBall;
    CGFloat _space; // lon' hon diameter
    CGFloat _ballDiameter;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _margin = 40.0; // căn lề
    _ballDiameter=24.0;
    
    [self checkSizeOfApp];
    [self numberOfBallvsSpace];
    [self drawRowOfBall:11];

    //[self placeGreyBallAtX:100 andY:100 withTag:1];
}

// place: địa điểm
-(void) placeGreyBallAtX:(CGFloat) x
                    andY: (CGFloat) y
                 withTag: (int) tag
{
    UIImageView* ball = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"green"]];
    // tọa độ
    ball.center = CGPointMake(x, y);
    
    // phân biệt các quả bóng với nhau
    ball.tag = tag;
    
    [self.view addSubview:ball];
}


-(CGFloat) spaceBetweenBallCenterWhenNumberBallIsKnow: (int) n {
    return (self.view.bounds.size.width - 2 * _margin) / (n-1);
}

-(CGFloat) spaceHeightBetweenBallCenterWhenNumberBallIsKnow: (int) n {
    return (self.view.bounds.size.height - 2 * _margin) / (n-1);
}



-(void) numberOfBallvsSpace {
    bool stop = false;
    int n = 3;
    while (!stop) {
        CGFloat space = [self spaceBetweenBallCenterWhenNumberBallIsKnow: n];
        // diameter: đường kính
        if (space < _ballDiameter) {
            stop = true;
        } else {
            NSLog(@"Number of ball %d, space between ball center %3.0f", n, space);
        }
        n++;
    }
}


-(void) drawRowOfBall: (int) numberBalls{
    CGFloat space = [self spaceBetweenBallCenterWhenNumberBallIsKnow:numberBalls];
    CGFloat spaceHeight = [self spaceHeightBetweenBallCenterWhenNumberBallIsKnow:numberBalls];
    int y = 100;
    for(int i = 0; i < numberBalls; i++){
        for(int j = 0; j < numberBalls; j++){
            [self placeGreyBallAtX:_margin + j * space
                              andY:y
                           withTag:i + 100];
        }
        y = _margin + i * spaceHeight;
        
        
    }
}


-(void) checkSizeOfApp{
    CGSize size = self.view.bounds.size;
    NSLog(@"width = %3.0f, height = %3.0f", size.width, size.height);
}




@end
