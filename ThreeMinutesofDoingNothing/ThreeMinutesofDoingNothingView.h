//
//  ThreeMinutesofDoingNothingView.h
//  ThreeMinutesofDoingNothing
//
//  Created by Eric Li on 10/4/18.
//  Copyright © 2018 O-R-G. All rights reserved.
//

#import <ScreenSaver/ScreenSaver.h>

@interface ThreeMinutesofDoingNothingView : ScreenSaverView {
    // Instance variables
    
    float xFactor, yFactor, theta;
    int xPos, yPos, boxSize, randomRedraw, randomTimer;
    NSSize size;
    BOOL PDFDrawFlag;
}

// Additional (non-static) methods

- (void) initValues;

@end
