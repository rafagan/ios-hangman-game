//
//  Player.h
//  PVJogoForca
//
//  Created by Rafagan on 26/11/13.
//  Copyright (c) 2013 Rodolpho Pinto. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property (nonatomic)int lifes;
@property (nonatomic,strong)NSMutableArray* lettersSpoke;

+ (Player*)createWithLifes:(int)lifes;

@end
