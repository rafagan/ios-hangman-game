//
//  MainViewController.h
//  PVJogoForca
//
//  Created by Rodolpho Pinto on 26/11/13.
//  Copyright (c) 2013 Rodolpho Pinto. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *gallowsImage;

@property (weak, nonatomic) IBOutlet UIPickerView *pickerViewSelect;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerViewWord;

- (IBAction)onTouchBtTry:(id)sender;
- (IBAction)onTouchRestartBt:(id)sender;
@end
