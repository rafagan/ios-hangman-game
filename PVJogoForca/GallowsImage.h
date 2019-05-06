//
//  GallowsImage.h
//  PVJogoForca
//
//  Created by Rafagan on 26/11/13.
//  Copyright (c) 2013 Rodolpho Pinto. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GallowsImage : NSObject

@property (nonatomic,strong) NSString* name;
@property (nonatomic,strong) UIImage* image;

+ (GallowsImage*)createWithName:(NSString*)name;

@end
