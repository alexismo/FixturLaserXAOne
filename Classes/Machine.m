//
//  Machine.m
//  fixturLaser
//
//  Created by Alexis Morin on 12/10/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Machine.h"


@implementation Machine

@synthesize name, location;
@synthesize rpm, angularTolerance, offsetTolerance, lastAligned;

- (id)initWithName:(NSString *)newName withRPM:(int)newRPM withLocation:(NSString *)newLocation withLastAlignment:(NSString *)newAligned{
	self = [super init];
	if (self){
		name = newName;
		rpm = newRPM;
		location = newLocation;
		lastAligned = newAligned;
		return self;
	}else {
		return nil;
	}

}

- (NSString *)description{
	return [NSString stringWithFormat:@"%@, %@, %@", name, rpm, location];
}

- (float)angularTolerance{//calculates the angularTolerance
	return (float)rpm/100000;
}

- (float)offsetTolerance{//calculates the angularTolerance
	return (float)rpm/200000;
}

- (void)dealloc{
	
	[super dealloc];
}


@end
