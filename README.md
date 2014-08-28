KILogInject
===========

![](http://img.shields.io/cocoapods/v/KILogInject.svg?style=flat)

![](https://dl.dropboxusercontent.com/u/7817937/_github/kiloginject.png)

KILogInject is a set of logger utilities. It contains..

1. [Method call logger](#method-call-logger)
2. [Property change logger](#property-change-logger)
3. [Notification logger](#notification-logger)

Method Call Logger
---

NSLog() without NSLog()! It logs arguments and return value of targeted method behalf of you.

![](https://dl.dropboxusercontent.com/u/7817937/_github/kiloginject_method.png)

To inject the logger, do following. (You can do this anywhere.)

```objc
[KILogInject inspect:@selector(strcat:withString:) of:someObject];
```

Then `KILogInjector` will records the log for every method call.

Or inject a class?
---

```objc
[KILogInject inspectInstanceMethods:@selector(strcat:withString:) of:[SomeClass class]];
```

You can do this in anywhere. Even you can declare logger injection in your AppDelegate!

```objc
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self injectLoggers];
    
    return YES;
}

- (void)injectLoggers {
    ..
    [KILogInject inspectInstanceMethod:@selector(strcat:withString:) ofClass:[SomeClass class]];
    ..
}
```

Property Change Logger
---

```objc
[KILogInject properties:object];
```

Then when you set some properties of the object, `KILogInject` will records the changes like..

![](https://dl.dropboxusercontent.com/u/7817937/_github/kiloginject.png)

```
➠ <Book: 0x8d48770>.author = John Smith ⇦ <null>
➠ <Book: 0x8d48770>.title = Effective Cocoa ⇦ <null>
➠ <Book: 0x8d48770>.price = 20 ⇦ 0

➠ <Book: 0x8d48770>.title = Effective Cocoa 2nd edition ⇦ Effective Cocoa
➠ <Book: 0x8d48770>.price = 40 ⇦ 20
```

Notification Logger
---

```objc
[KILogInject notification:@"SomeNotificationName" from:someObject];
```

Will records

```
NSNotification<SomeNotificationName> from <SomeClass: 0x8da64d0>
```

Or there is shorthand for object:`nil` notifications.

```objc
[KILogInject notification:@"SomeNotificationName"];
```

LICENSE
---

The MIT License (MIT)

Copyright (c) 2014 kaiinui

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
