//
//  WordStore.m
//  PVJogoForca
//
//  Created by Rodolpho Pinto on 26/11/13.
//  Copyright (c) 2013 Rodolpho Pinto. All rights reserved.
//

#import "WordStore.h"
#import "Word.h"

@interface WordStore ()
{
    NSMutableArray *words;
}
@end

@implementation WordStore

+ (WordStore *)sharedStore
{
    static WordStore *sharedStore = nil;
    if (!sharedStore)
        sharedStore = [[super alloc] init];
    
    return sharedStore;
}

- (id)init
{
    self = [super init];
    if (self) {
        self.lettersChoose = [[NSString alloc] init];
        words = [[NSMutableArray alloc] init];
        [self newWordWithName:@"IOS"];
        [self newWordWithName:@"ANDROID"];
        [self newWordWithName:@"ARTEMIS"];
        [self newWordWithName:@"YODA"];
        [self newWordWithName:@"SPOCK"];
    }
    return self;
}

- (NSArray *)words
{
    return words;
}

- (NSString *)raffleWord
{
    Word *w =[words objectAtIndex:arc4random_uniform((int)words.count)];
    NSLog(@"%@", w.name);
    self.currentWord = [w name];
    
    return self.currentWord;
}

- (Word *)newWordWithName:(NSString *)name
{
    Word *word = [[Word alloc] initWithName:name];
    [words addObject:word];
    
    return word;
}

- (BOOL)letterAlreadyWasSelected:(NSString *)pickerLetter {
    for (int i = 0; i < self.lettersChoose.length; i++) {
        BOOL letterAlreadyWasSelected = [[self.lettersChoose substringWithRange:(NSRange) {i,1}] isEqual: pickerLetter];
        if(letterAlreadyWasSelected) {
            return YES;
        }
    }
    return NO;
}

- (BOOL)wordConstainsLetter:(NSString *)pickerLetter {
    for (int i = 0; i < self.currentWord.length; i++) {
        BOOL letterIsInCurrentChallengeWord = [[self.currentWord substringWithRange:(NSRange) {i,1}] isEqual: pickerLetter];
        if(letterIsInCurrentChallengeWord) {
            return YES;
        }
    }
    return NO;
}

- (BOOL)whichLetter:(NSString *)pickerLetter
{
    //Testa se a letra já foi selecionada
    for (int i = 0; i < self.lettersChoose.length; i++) {
        BOOL letterAlreadyWasSelected = [[self.lettersChoose substringWithRange:(NSRange) {i,1}] isEqual: pickerLetter];
        if(letterAlreadyWasSelected) {
            return YES;
        }
    }
    
    //Concatena a letra ao conjunto de letras escolhidas
    self.lettersChoose = [NSString stringWithFormat:@"%@%@", self.lettersChoose, pickerLetter];
    
    //Testa se a letra esta presente dentro do conjunto de letras da palavra
    for (int i = 0; i < self.currentWord.length; i++) {
        BOOL letterIsInCurrentChallengeWord = [[self.currentWord substringWithRange:(NSRange) {i,1}] isEqual: pickerLetter];
        if(letterIsInCurrentChallengeWord) {
            return YES;
        }
    }
    return NO;
}

@end
