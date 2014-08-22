KILogInject
===========

NSLog() without NSLog()! It logs arguments and return value of targeted method behalf of you.

```
2014-08-21 18:48:02.789 SomeApp[32613:60b] 
<SomeClass: 0x8d1a810> ⇢ -justStrcat:withString:(
    Harry,
    Potter
)
2014-08-21 18:48:03.792 SomeApp[32613:60b] 
<SomeClass: 0x8d1a810> ⇠ -justStrcat:withString: [87ms] = HarryPotter
```

To inject the logger, do following. (You can do this anywhere.)

```objc
[KILogInject inspect:@selector(justStrcat:withString:) of:someObject];
```

Then call the method to see the logs! (Please note, `justStrcat:withString:` does not log anything.)

```objc
[someObject justStrcat:@"Harry" withString:@"Potter"];
```

The implementation of the method is just concat string.

```objc
- (void)justStrcat:(NSString *)aString withString:(NSString *)bString {
    return [NSString stringWithFormat:@"%@%@", aString, bString];
}
```

Or inject a Class?
---

```objc
[KILogInject inspectInstanceMethods:@selector(justStrcat:withString:) of:[SomeClass class]];
```

You can do this in anywhere. Even you can declare logger injection in your AppDelegate!

```objc
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self injectLoggers];
    
    return YES;
}

- (void)injectLoggers {
    ..
    [KILogInject inspectInstanceMethod:@selector(justStrcat:withString:) ofClass:[SomeClass class]];
    ..
}
```

:sushi:

LOADMAP
---

- [ ] Observes instance properties and log the changes.
- [ ] Receives notifications and log them.

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
