//
//  ImageModel.h
//  UserInterfaceExample
//
//  Created by Eric Larson on 9/2/20.
//  Copyright © 2020 Eric Larson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ImageModel : NSObject

+(ImageModel*)sharedInstance;
-(UIImage*)getImageWithName:(NSString*)name;
-(UIImage*)getImageWithIndex:(NSInteger)index;
-(NSInteger)numberOfImages;
-(NSString*)getImageName:(NSInteger)index;

@property (strong, readonly, nonatomic) NSMutableDictionary* loadImages;
//@property (strong, readonly, nonatomic) NSArray* imageNames;

@end

NS_ASSUME_NONNULL_END
