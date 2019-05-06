//
//  GallowsImage.m
//  PVJogoForca
//
//  Created by Rafagan on 26/11/13.
//  Copyright (c) 2013 Rodolpho Pinto. All rights reserved.
//

#import "GallowsImage.h"

@implementation GallowsImage

+ (GallowsImage *)createWithName:(NSString *)name
{
    GallowsImage* img = [[GallowsImage alloc]init];
    img.name = name;
    img.image = [UIImage imageNamed:name];
    return img;
}

@end
