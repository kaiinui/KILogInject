KILogInject
---

![](http://img.shields.io/cocoapods/v/KILogInject.svg?style=flat)

```
2014-08-21 18:48:02.789 SomeApp[32613:60b] 
<SomeClass: 0x8d1a810> ⇢ -justStrcat:withString:(
    Harry,
    Potter
)
2014-08-21 18:48:03.792 SomeApp[32613:60b] 
<SomeClass: 0x8d1a810> ⇠ -justStrcat:withString: [87ms] = HarryPotter
```

こんなのをメソッド内に `NSLog(@"%@ %@ %@", hoge, huga, duga);` とかやらずに出せます。

使い方？
---

```objc
[KILogInject inspect:@selector(justStrcat:withString:) of:someObject];
```

または、特定のオブジェクトではなくこんな感じの使い方も出来ます。

```objc
[KILogInject inspectInstanceMethods:@selector(justStrcat:withString:) of:[SomeClass class]];
```

いい感じの使い方
---

`AppDelegate` でこんな感じにする。（ちなみに `DEBUG` 時のみログります）

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
