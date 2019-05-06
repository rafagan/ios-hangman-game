//
//  DataSource.h
//  PVJogoForca
//
//  Created by Rafagan on 26/11/13.
//  Copyright (c) 2013 Rodolpho Pinto. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GallowsImage.h"
#import "Player.h"

#define DATA_SRC [DataSource getMe]

@interface DataSource : NSObject
{
    NSMutableArray* gallowsImages;
}

@property (nonatomic,strong)Player* currentPlayer;

+ (DataSource*)getMe;
- (GallowsImage*)getGallowsImageWithIndex:(int)index;

@end
