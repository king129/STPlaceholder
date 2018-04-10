#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "STPlaceholder.h"
#import "STPlaceholderBaseView.h"
#import "STPlaceholderDefaultView.h"
#import "UIScrollView+Placeholder.h"

FOUNDATION_EXPORT double STPlaceholderVersionNumber;
FOUNDATION_EXPORT const unsigned char STPlaceholderVersionString[];

