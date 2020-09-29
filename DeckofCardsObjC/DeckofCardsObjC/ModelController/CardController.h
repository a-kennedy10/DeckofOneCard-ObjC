//
//  CardController.h
//  DeckofCardsObjC
//
//  Created by Alex Kennedy on 9/29/20.
//  Copyright © 2020 Alex Kennedy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DVMCard.h"
#import <UIKit/UIKit.h>


@interface CardController : NSObject

+ (void)drawANewCardWithCompletion:(void(^) (DVMCard * cards)) completion;

+ (void)fetchCardImage:(DVMCard *)card completion:(void (^) (UIImage *))completion;


@end

