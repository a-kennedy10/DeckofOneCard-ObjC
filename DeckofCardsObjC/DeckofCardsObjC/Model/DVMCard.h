//
//  DVMCard.h
//  DeckofCardsObjC
//
//  Created by Alex Kennedy on 9/29/20.
//  Copyright © 2020 Alex Kennedy. All rights reserved.
// https://deckofcardsapi.com/api/deck/new/draw/

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DVMCard : NSObject

@property (nonatomic, copy, readonly) NSString *suit;
@property (nonatomic, copy, readonly) NSString *value;
@property (nonatomic, copy, readonly) NSString *image;

- (instancetype)initWithSuit:(NSString *)suit
                       value:(NSString *)value
                       image:(NSString *)image;

@end

@interface DVMCard (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *, id>* )topLevelDictionary;

@end

NS_ASSUME_NONNULL_END
