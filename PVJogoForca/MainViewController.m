//
//  MainViewController.m
//  PVJogoForca
//
//  Created by Rodolpho Pinto on 26/11/13.
//  Copyright (c) 2013 Rodolpho Pinto. All rights reserved.
//

#import "MainViewController.h"
#import "WordStore.h"
#import "Word.h"
#import "DataSource.h"

@interface MainViewController ()
{
    NSString *alphabet;
    NSString *currentWord;
    NSString *currentLetterInPicker;
    NSInteger currentPickerRow;
    
    NSInteger correctLetters;
}

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        alphabet = [[NSString alloc] init];
        currentWord = [[NSString alloc] init];
        currentWord = [[WordStore sharedStore] raffleWord];
        alphabet = @"-ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        currentLetterInPicker = @"-";
        correctLetters = 0;
    }
    return self;
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    if(pickerView == self.pickerViewSelect)
        return 1;
    else
        return currentWord.length;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return alphabet.length;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if(pickerView == self.pickerViewSelect){
        currentLetterInPicker = [alphabet substringWithRange:(NSRange){row,1}];
        currentPickerRow = row;
    }
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    
    CGRect frame = CGRectMake(0.0, 0.0, 15, 15);
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    
    //Se estiver no grupo das já selecionadas
    NSString* currentLetter = [alphabet substringWithRange:(NSRange){row,1}];
    label.text = [alphabet substringWithRange:(NSRange){row,1}];
    
    if(pickerView != self.pickerViewSelect)
        return label;
    
    if ([[WordStore sharedStore] letterAlreadyWasSelected:currentLetter]) {
        if ([[WordStore sharedStore] wordConstainsLetter:currentLetter]) {
            label.backgroundColor = [UIColor greenColor];
        } else {
            label.backgroundColor = [UIColor redColor];
        }
    }
    
    return label;
}

- (IBAction)onTouchBtTry:(id)sender {
    if (DATA_SRC.currentPlayer.lifes < 1 || [currentLetterInPicker isEqualToString:@"-"]) {
        return;
    }
    
    if ([[WordStore sharedStore] whichLetter:currentLetterInPicker]) {
        for(int i=0;i<currentWord.length;i++) {
            BOOL correctLetter = [[currentWord substringWithRange:(NSRange) {i,1}] isEqual: currentLetterInPicker];
            if(correctLetter) {
                [self.pickerViewWord selectRow:currentPickerRow inComponent:i animated:YES];
                correctLetters += 1;
            }
        }
    } else {
        DATA_SRC.currentPlayer.lifes--;
        self.gallowsImage.image = [DATA_SRC getGallowsImageWithIndex:DATA_SRC.currentPlayer.lifes].image;
    }
    
    if (correctLetters == [WordStore sharedStore].currentWord.length) {
        self.gallowsImage.image = [UIImage imageNamed:@"You Win"];
    }
    
    [self.pickerViewSelect reloadAllComponents];
}

- (IBAction)onTouchRestartBt:(id)sender {
    DATA_SRC.currentPlayer.lifes = 6;
    self.gallowsImage.image = [DATA_SRC getGallowsImageWithIndex:6].image;
    [self.pickerViewSelect selectRow:0 inComponent:0 animated:YES];
    
    for (int i=0; i<currentWord.length; i++) {
        [self.pickerViewWord selectRow:0 inComponent:i animated:YES];
    }
    currentWord = [[WordStore sharedStore] raffleWord];
    
    [WordStore sharedStore].lettersChoose = @"";
    correctLetters = 0;
    
    [self.pickerViewWord reloadAllComponents];
    [self.pickerViewSelect reloadAllComponents];
}
@end
