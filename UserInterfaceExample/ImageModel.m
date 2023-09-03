//
//  ImageModel.m
//  UserInterfaceExample
//
//  Created by Eric Larson on 9/2/20.
//  Copyright © 2020 Eric Larson. All rights reserved.
//

#import "ImageModel.h"


//@implementation ImageModel
//@synthesize imageNames = _imageNames;

@interface ImageModel ()
@property (nonatomic, readwrite, strong) NSArray *imageNames;
@end

@implementation ImageModel
//@synthesize imageNames = _imageNames;


+ (ImageModel *)sharedInstance {
    static ImageModel *_sharedInstance = nil;
    static dispatch_once_t predicate;

    dispatch_once(&predicate, ^{
        _sharedInstance = [[ImageModel alloc] init];
    });
    return _sharedInstance;
}

//-(NSArray*) imageNames{
//    if(!_imageNames)
//        _imageNames = @[@"Bill",@"Eric",@"Jeff"];
//
//    return _imageNames;
//}

- (NSDictionary*) loadImages{
    NSMutableDictionary *imagesDictionary = [NSMutableDictionary dictionary];
    
    _imageNames = @[@"Bill",@"Eric",@"Jeff",@"elephant",@"lion",@"leopard"];

    for (NSString *name in _imageNames) {
        UIImage *image = [UIImage imageNamed:name];
        [imagesDictionary setObject:image forKey:name];
    }

    return imagesDictionary;
}

- (UIImage *)getImageWithName:(NSString *)name {
    static NSDictionary *imagesDictionary = nil;
    
    if (!imagesDictionary) {
        imagesDictionary = [self loadImages];
    }
    
    UIImage *image = imagesDictionary[name];
    
    if (!image) {
        NSLog(@"Image not found in dictionary for name: %@", name);
    }
    
    return image;
}

- (UIImage *)getImageWithIndex:(NSInteger)index {
    NSArray *imageNames = [self loadImages].allKeys;
    
    if (index >= 0 && index < imageNames.count) {
        NSString *imageName = imageNames[index];
        return [self getImageWithName:imageName];
    } else {
        NSLog(@"Invalid index");
        return nil;
    }
}

- (NSInteger)numberOfImages {
    return [self loadImages].count;
}

- (NSString *)getImageName:(NSInteger)index {
    NSArray *imageNames = [self loadImages].allKeys;
    
    if (index >= 0 && index < imageNames.count) {
        return imageNames[index];
    } else {
        NSLog(@"Invalid index");
        return nil;
    }
}

@end
