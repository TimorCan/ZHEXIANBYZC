//
//  WChartLine.m
//  WChartView
//
//  Created by wangsen on 15/12/13.
//  Copyright © 2015年 wangsen. All rights reserved.
//

#import "SNChartLine.h"
#import "UIBezierPath+curved.h"
#define kBtnTag 100
#define kLineColor [UIColor colorWithRed:255/255.f green:50/255.f blue:10/255.f alpha:1]
#define kCirCleColor [UIColor colorWithRed:0.859f green:0.871f blue:0.882f alpha:1.00f]
#define kHVLineColor [UIColor colorWithRed:0.918f green:0.929f blue:0.949f alpha:1.00f]
#define kBulldesFont [UIFont systemFontOfSize:10]

static const NSInteger kYEqualPaths = 1;//y轴为5等份
static const CGFloat kTopSpace = 25.f;//距离顶部y值

@interface SNChartLine ()
@property (nonatomic, strong) CAShapeLayer * shapeLayer;
@property (nonatomic, strong) NSMutableArray * pointXArray;
@property (nonatomic, strong) NSMutableArray * pointYArray;
@property (nonatomic, strong) NSMutableArray * points;

@property (nonatomic, strong) UIImageView * bulldesImageView;
@property (nonatomic, strong) UILabel * bulldesLabel;

@property (nonatomic,assign)CGFloat  Yheight; //用来记录

@end
@implementation SNChartLine

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.curve = NO;
        
    }
    return self;
}

- (NSMutableArray *)pointYArray {
    if (!_pointYArray) {
        _pointYArray = [NSMutableArray array];
    }
    return _pointYArray;
}

- (NSMutableArray *)points {
    if (!_points) {
        _points = [NSMutableArray array];
    }
    return _points;
}

- (NSMutableArray *)pointXArray {
    if (!_pointXArray) {
        _pointXArray = [NSMutableArray array];
    }
    return _pointXArray;
}

- (void)setYMax:(CGFloat)yMax {
    _yMax = yMax;
}

- (void)setCurve:(BOOL)curve {
    _curve = curve;
}

- (void)setYValues:(NSArray *)yValues {
    _yValues = yValues;
    [self drawHorizontal];
}

- (void)setXValues:(NSArray *)xValues {
    _xValues = xValues;
    [self drawVertical];
}
//画横线
- (void)drawHorizontal {
    
    UIBezierPath * path = [UIBezierPath bezierPath];
    CAShapeLayer * shapeLayer = [CAShapeLayer layer];
    
    for (NSInteger i = 0; i <= kYEqualPaths; i++) {
        
        [path moveToPoint:CGPointMake(-10+chartLineStartX, chartLineTheYAxisSpan * i + kTopSpace)];
        [path addLineToPoint:CGPointMake(10+chartLineStartX + (_xValues.count - 1) * chartlineWidtrh, chartLineTheYAxisSpan * i + kTopSpace)];
        [path closePath];
        shapeLayer.path = path.CGPath;
        shapeLayer.strokeColor = [UIColor colorWithWhite:123/255.f alpha:1.0].CGColor;
        shapeLayer.fillColor = [[UIColor whiteColor] CGColor];
        shapeLayer.lineWidth = 0.3f;
        [self.layer addSublayer:shapeLayer];
    }

}
//画竖线
- (void)drawVertical {

    UIBezierPath * path = [UIBezierPath bezierPath];
    CAShapeLayer * shapeLayer = [CAShapeLayer layer];
    
    [_xValues enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger i, BOOL * _Nonnull stop) {
        [path moveToPoint:CGPointMake(chartLineStartX+ chartLineTheXAxisSpan*i,kTopSpace)];
        [path addLineToPoint:CGPointMake(chartLineStartX + chartLineTheXAxisSpan * i,chartLineTheYAxisSpan * kYEqualPaths + kTopSpace)];
        
        self.Yheight = chartLineTheYAxisSpan * kYEqualPaths + kTopSpace;
        
        [path closePath];
        shapeLayer.path = path.CGPath;
        shapeLayer.strokeColor = [UIColor colorWithWhite:123/255.f alpha:1.0].CGColor;
        shapeLayer.fillColor = [[UIColor whiteColor] CGColor];
        shapeLayer.lineWidth = 0.3f;
        [self.layer addSublayer:shapeLayer];
    }];
    
    
}

- (void)startDrawLines {
    //设置x轴
   
  
    
    [_xValues enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger i, BOOL * _Nonnull stop) {
        [self.pointXArray addObject:@(chartLineStartX + chartLineTheXAxisSpan * i)];
    }];
    
      //设置y轴
    [_xValues enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger i, BOOL * _Nonnull stop) {
        [self.pointYArray addObject:@(chartLineTheYAxisSpan * kYEqualPaths - [_yValues[i] floatValue]/_yMax * chartLineTheYAxisSpan * kYEqualPaths + kTopSpace)];
    }];
    
    
  
    //增加yuandian
    [_xValues enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger i, BOOL * _Nonnull stop) {
        [self addCircle:CGPointMake(chartLineStartX+ chartLineTheXAxisSpan*i,kTopSpace) andIndex:i isTop:YES isPoint:NO];
        [self addCircle:CGPointMake(chartLineStartX + chartLineTheXAxisSpan * i,chartLineTheYAxisSpan * kYEqualPaths + kTopSpace) andIndex:i+1000 isTop:NO isPoint:NO];
    }];
    
    [self.pointXArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger i, BOOL * _Nonnull stop) {
        CGPoint point = CGPointMake([self.pointXArray[i] floatValue], [self.pointYArray[i] floatValue]);
        NSValue * value = [NSValue valueWithCGPoint:point];
        [self.points addObject:value];
    }];
    
    
    
    //画线
    _shapeLayer = [CAShapeLayer layer];
    _shapeLayer.lineCap = kCALineCapRound;
    _shapeLayer.lineJoin = kCALineJoinRound;
    _shapeLayer.lineWidth = 1.f;
    _shapeLayer.fillColor = [UIColor clearColor].CGColor;
    _shapeLayer.strokeEnd = 0.f;
    _shapeLayer.strokeColor = kLineColor.CGColor;
    [self.layer addSublayer:_shapeLayer];

    UIBezierPath * bezierLine = [UIBezierPath bezierPath];
    for (NSInteger i = 0; i < self.points.count; i++) {
        CGPoint point = [self.points[i] CGPointValue];
        if (i == 0) {
            [bezierLine moveToPoint:point];
        } else {
            [bezierLine addLineToPoint:point];
        }
        [self addCircle:point andIndex:i isTop:YES isPoint:YES];
        [self addXLabel:point andIndex:i];
    }
    
//    [self addYLabel];
    
    if (self.curve) {
        bezierLine =[bezierLine smoothedPathWithGranularity:0];//设置曲线
    }
    _shapeLayer.path = bezierLine.CGPath;
    
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = self.points.count * 0.5f;
    pathAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pathAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
    pathAnimation.toValue = [NSNumber numberWithFloat:1.f];
    pathAnimation.autoreverses = NO;
    [_shapeLayer addAnimation:pathAnimation forKey:@"strokeEndAnimation"];
    _shapeLayer.strokeEnd = 1.f;
}

//圆圈
- (void)addCircle:(CGPoint)point andIndex:(NSInteger)index isTop:(BOOL)istop isPoint:(BOOL)ispoint{
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 5, 5);
    btn.center = point;
    [self addSubview:btn];
    btn.tag = index + kBtnTag;
    btn.backgroundColor = [UIColor whiteColor];
    if (istop) {
         btn.backgroundColor = [UIColor blackColor];
    }
    if(ispoint)
    {
        btn.backgroundColor = [UIColor redColor];
        
        if (point.y==_Yheight) {
            btn.backgroundColor = [UIColor whiteColor];
            btn.alpha = 0.5;
        }
        
    }
    btn.layer.cornerRadius = 2.5f;
    btn.layer.masksToBounds = YES;
//    [btn addTarget:self action:@selector(circleButtonClick:) forControlEvents:UIControlEventTouchUpInside];
}

//标记x轴label
- (void)addXLabel:(CGPoint)point andIndex:(NSInteger)index {
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0, -10, chartLineTheXAxisSpan, 30)];
    label.center = CGPointMake(point.x, chartLineTheYAxisSpan * kYEqualPaths + kTopSpace+10);
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor colorWithWhite:23/255.f alpha:1.f];
    label.font = [UIFont systemFontOfSize:8.f];
//    label.adjustsFontSizeToFitWidth =YES;
    label.textAlignment = NSTextAlignmentCenter;
    label.text = _xValues[index];
    [self addSubview:label];
}

//标记y轴label
- (void)addYLabel {
    for (NSInteger i = 0; i <= kYEqualPaths; i++) {
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0, chartLineTheYAxisSpan * i + kTopSpace, chartLineStartX - 5, 10)];
        label.textColor = [UIColor lightGrayColor];
        label.font = [UIFont systemFontOfSize:10.f];
        label.textAlignment = NSTextAlignmentRight;
        [self addSubview:label];
        if (i == kYEqualPaths) {
            label.text = @"0";
        } else {
            label.text = [NSString stringWithFormat:@"%.2f",_yMax - _yMax/5.f * i];
        }
    }
}
//圆圈点击事件
- (void)circleButtonClick:(UIButton *)btn {
    CGFloat x = btn.frame.origin.x;
    CGFloat y = btn.frame.origin.y;
    NSString * content = _yValues[btn.tag - kBtnTag] ;
    CGSize size = [content sizeWithAttributes:@{NSFontAttributeName:kBulldesFont}];
    if (size.width < 25.f) {
        size.width = 25.f;
    }
    [self addBulldesView];
    _bulldesImageView.frame = CGRectMake(x, y - 20.f, size.width, 20);
    _bulldesLabel.frame = CGRectMake(0, 1, _bulldesImageView.frame.size.width, 10);
    _bulldesLabel.text = content;
}

- (void)addBulldesView {
    
    if (!_bulldesImageView) {
        _bulldesImageView = [[UIImageView alloc] init];
        [self addSubview:_bulldesImageView];
        UIImage * image = [UIImage imageNamed:@"气泡"];
        UIImage * resizableImage = [image resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 5, 0) resizingMode:UIImageResizingModeStretch];
        _bulldesImageView.image = resizableImage;
    }
    if (!_bulldesLabel) {
        _bulldesLabel = [[UILabel alloc] init];
        _bulldesLabel.textColor = [UIColor whiteColor];
        _bulldesLabel.font = kBulldesFont;
        _bulldesLabel.textAlignment = NSTextAlignmentCenter;
        [_bulldesImageView addSubview:_bulldesLabel];
    }

}

@end
