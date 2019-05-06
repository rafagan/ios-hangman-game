//
//  Word.h
//  PVJogoForca
//
//  Created by Rodolpho Pinto on 26/11/13.
//  Copyright (c) 2013 Rodolpho Pinto. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Word : NSObject

-(id)initWithName:(NSString *)n;

@property (nonatomic, strong) NSString *name;

@end
