//
//  ThreeMinutesofDoingNothingView.m
//  ThreeMinutesofDoingNothing
//
//  Created by Eric Li on 10/4/18.
//  Copyright © 2018 O-R-G. All rights reserved.
//

#import "ThreeMinutesofDoingNothingView.h"

@implementation ThreeMinutesofDoingNothingView

- (instancetype)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview
{
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self) {
        [self setAnimationTimeInterval:1/10.0];
    }
    return self;
}

- (void)startAnimation
{
    [self initValues];
    [super startAnimation];
}

- (void)stopAnimation
{
    [super stopAnimation];
}

- (void)drawRect:(NSRect)rect
{
    [super drawRect:rect];
    int tempTheta = 1;
    int tempBoxSize = 1;
    float tempAlpha = 1.0-.018*theta;

    xPos = ( size.width / 2 );
    yPos = ( size.height / 2 );

    for (tempBoxSize = 1; tempBoxSize <= boxSize; tempBoxSize += tempTheta*2) {
        NSBezierPath *path;
        NSColor *color;
        NSRect dotRect;
        NSPoint dotPoint;

        // Increment theta and set boxSize
        dotRect.size = NSMakeSize( tempBoxSize, tempBoxSize );

        // Calculate position, set origin
        xPos -= ( tempTheta * 1 );
        yPos -= ( tempTheta * 1 );
        dotPoint.x = xPos;
        dotPoint.y = yPos;
        dotRect.origin = dotPoint;
        path = [NSBezierPath bezierPathWithRect:dotRect];

        [path setLineWidth: 1];

        color = [NSColor colorWithCalibratedRed:255 green:255 blue:255 alpha:tempAlpha];
        [color set];
        [path stroke];
        
        if (tempBoxSize > size.width) {
            break;
        }

        tempAlpha += .018;
        tempTheta += 1;
    }
}

- (void)animateOneFrame
{
    if ( theta >= randomRedraw || theta == 0 ) {
        boxSize = 1;
        theta = 1;
        randomRedraw = (int) SSRandomFloatBetween( 90, 110 );
    } else {
        theta += 1;
    }

    boxSize += ( theta * 2 );
    
    [self setNeedsDisplay:YES];
    return;
}

- (BOOL)hasConfigureSheet
{
    return NO;
}

- (NSWindow*)configureSheet
{
    return nil;
}

- (void) initValues
{
    // Initialize all values, make new lissajous
    
    // Need to clean up all variable names and perhaps make the redrawing begin again, and make it a rectangle?
    // All drawing relative to screen size
    
    xFactor = SSRandomFloatBetween( 0, 2.0 );
    yFactor = SSRandomFloatBetween( 0, 2.0 );
    randomRedraw = (int) SSRandomFloatBetween( 90, 110 );
    boxSize = 1;
    size = [self bounds].size;
    xPos = ( size.width / 2 ) - boxSize;
    yPos = ( size.height / 2 ) - boxSize;
    theta = 0.0;
    PDFDrawFlag = YES;
}

@end
