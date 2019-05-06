//
//  Word.m
//  PVJogoForca
//
//  Created by Rodolpho Pinto on 26/11/13.
//  Copyright (c) 2013 Rodolpho Pinto. All rights reserved.
//

#import "Word.h"

@implementation Word

- (id)initWithName:(NSString *)n
{
    self = [super init];
    if (self) {
        [self setName:n];
    }
    return self;
}

@end
