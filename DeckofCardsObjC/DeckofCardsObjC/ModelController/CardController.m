//
//  CardController.m
//  DeckofCardsObjC
//
//  Created by Alex Kennedy on 9/29/20.
//  Copyright © 2020 Alex Kennedy. All rights reserved.
//

#import "CardController.h"
#import "DVMCard.h"

@implementation CardController

static NSString * const baseURLString = @"https://deckofcardsapi.com/api/deck/new";
static NSString * const drawEndpoint = @"draw";

+ (void)drawANewCardWithCompletion:(void (^)(DVMCard *))completion {
    
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURL *finalURL = [baseURL URLByAppendingPathComponent:drawEndpoint];
    NSLog(@"%@", finalURL);
    
    [[NSURLSession.sharedSession dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            NSLog(@"There was an error %@, %@", error, error.localizedDescription);
            completion(nil);
            return;
        }
        if (!data)
        {
            NSLog(@"There appears to be no data");
            return completion(nil);
        }
        NSDictionary *topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error: &error];
            
            if (!topLevelDictionary)
            {
                NSLog(@"Error parsing JSON: %@", error);
                completion(nil);
                return;
            }
            
            NSArray *cardsArray = topLevelDictionary[@"cards"];
            NSMutableArray *cardsDictArray = [NSMutableArray array];
            for (NSDictionary *cardDictionary in cardsArray)
            {
                DVMCard *card = [[DVMCard alloc] initWithDictionary:cardDictionary];
                [cardsDictArray addObject:card];
            }
         DVMCard *cardToReturn = cardsDictArray.firstObject;
            completion(cardToReturn);

            
        }] resume];
    
}


+ (void)fetchCardImage:(DVMCard *)card completion:(void (^)(UIImage *))completion
{
    NSURL *imageURL = [NSURL URLWithString:card.image];
    NSLog(@"%@", imageURL);
    
    [[NSURLSession.sharedSession dataTaskWithURL:imageURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            NSLog(@"There was an error %@, %@", error, error.localizedDescription);
            completion(nil);
            return;
        }
        
        if (!data)
        {
            NSLog(@"There was no data found for our image");
            completion(nil);
            return;
        }
        UIImage *image = [UIImage imageWithData:data];
        completion(image);
            
    }] resume];
}


@end
