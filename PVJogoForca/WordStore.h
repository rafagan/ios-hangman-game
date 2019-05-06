//
//  WordStore.h
//  PVJogoForca
//
//  Created by Rodolpho Pinto on 26/11/13.
//  Copyright (c) 2013 Rodolpho Pinto. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Word;

@interface WordStore : NSObject

@property (nonatomic, strong) NSString *lettersChoose;
@property (nonatomic, strong) NSString *currentWord;

+ (WordStore *)sharedStore;

- (NSArray *)words;

- (NSString *)raffleWord;

- (Word *)newWordWithName:(NSString *)name;

- (BOOL)whichLetter:(NSString *)pickerLetter;

- (BOOL)letterAlreadyWasSelected:(NSString *)pickerLetter;
- (BOOL)wordConstainsLetter:(NSString *)pickerLetter;

@end
