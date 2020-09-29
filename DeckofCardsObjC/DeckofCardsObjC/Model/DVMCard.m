//
//  DVMCard.m
//  DeckofCardsObjC
//
//  Created by Alex Kennedy on 9/29/20.
//  Copyright © 2020 Alex Kennedy. All rights reserved.
// https://deckofcardsapi.com/api/deck/new/draw/

#import "DVMCard.h"

@implementation DVMCard

- (instancetype)initWithSuit:(NSString *)suit value:(NSString *)value image:(NSString *)image
{
    if (self = [super init]) {
        _suit = suit;
        _value = value;
        _image = image;
    }
    return self;
}

@end

// JSONCovertable is naming the extension, no functionality 
@implementation DVMCard (JSONConvertable)

- (DVMCard *)initWithDictionary:(NSDictionary<NSString *,id> *)topLevelDictionary
{
    NSString *suit = topLevelDictionary[@"suit"];
    NSString *value = topLevelDictionary[@"value"];
    NSString *image = topLevelDictionary[@"image"];
    
    return [self initWithSuit:suit value: value image:image];
    
}

@end
