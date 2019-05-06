//
//  Player.m
//  PVJogoForca
//
//  Created by Rafagan on 26/11/13.
//  Copyright (c) 2013 Rodolpho Pinto. All rights reserved.
//

#import "Player.h"

@implementation Player

+ (Player *)createWithLifes:(int)lifes
{
    Player* p = [Player new];
    p.lifes = lifes;
    p.lettersSpoke = [NSMutableArray new];
    
    return p;
}

@end
