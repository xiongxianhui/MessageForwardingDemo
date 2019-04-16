//
//  Teacher.m
//  消息转发Demo
//
//  Created by xiongxianhui on 2019/4/16.
//  Copyright © 2019 xianhui. All rights reserved.
//

#import "Teacher.h"
#import "Student.h"
#import <objc/message.h>

@implementation Teacher

void eat(id self, SEL _cmd, NSString * food) {
    
    NSLog(@"Teacher C eat %@",food);
}

//动态解析
+ (BOOL)resolveInstanceMethod:(SEL)sel {

    if (sel == @selector(eat:)) {
        return  class_addMethod(self.class, @selector(eat:), (IMP)eat, "v@:@");
    }

    return NO;
}

//消息重定向
-(id)forwardingTargetForSelector:(SEL)aSelector {

    if (aSelector == @selector(eat:)) {
        return [Student new];
    }
    return [super forwardingTargetForSelector:aSelector];
}

//返回方法签名
-(NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    
    //生成方法签名
    if (aSelector == @selector(eat:)) {
        return [NSMethodSignature signatureWithObjCTypes:"v@:@"];
    }
    return [super methodSignatureForSelector:aSelector];
}

//标准转发
-(void)forwardInvocation:(NSInvocation *)anInvocation {
    
    if (anInvocation.selector == @selector(eat:)) {
        
        Student *student = [Student new];
        [anInvocation invokeWithTarget:student];
    }
}
-(void)doesNotRecognizeSelector:(SEL)aSelector {
    NSLog(@"最后一步,苹果建议抛出异常");
}

@end
