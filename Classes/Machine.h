//
//  Machine.h
//  fixturLaser
//
//  Created by Alexis Morin on 12/10/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

struct MMeasurements {
	int mFeet;
	int mCoupling;
	int sCoupling;
	int sFeet;
};

@interface Machine : NSObject {
	NSString *name;
	int rpm;
	float angularTolerance;
	float offsetTolerance;
	NSString *location;
	NSString *lastAligned;
}

@property (copy) NSString *name, *location, *lastAligned;
@property int rpm;
@property (readonly) float angularTolerance, offsetTolerance;

- (id)initWithName:(NSString *)newName withRPM:(int)newRPM withLocation:(NSString *)newLocation withLastAlignment:(NSString *)newAligned;

@end
