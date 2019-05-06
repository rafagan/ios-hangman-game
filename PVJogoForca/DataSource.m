//
//  DataSource.m
//  PVJogoForca
//
//  Created by Rafagan on 26/11/13.
//  Copyright (c) 2013 Rodolpho Pinto. All rights reserved.
//

#import "DataSource.h"
#import "GallowsImage.h"

@implementation DataSource

static DataSource* me;

+ (DataSource *)getMe
{
    if (me == nil) {
        me = [[DataSource alloc]init];
    }
    return me;
}

- (id)init
{
    self = [super init];
    if (self) {
        gallowsImages = [NSMutableArray new];
        [gallowsImages addObject:[GallowsImage createWithName:@"G"]];
        [gallowsImages addObject:[GallowsImage createWithName:@"F"]];
        [gallowsImages addObject:[GallowsImage createWithName:@"E"]];
        [gallowsImages addObject:[GallowsImage createWithName:@"D"]];
        [gallowsImages addObject:[GallowsImage createWithName:@"C"]];
        [gallowsImages addObject:[GallowsImage createWithName:@"B"]];
        [gallowsImages addObject:[GallowsImage createWithName:@"A"]];
        
        self.currentPlayer = [Player createWithLifes:6];
    }
    return self;
}

- (GallowsImage *)getGallowsImageWithIndex:(int)index
{
    if(index >= gallowsImages.count)
        return nil;
    
    return [gallowsImages objectAtIndex:index];
}

@end
