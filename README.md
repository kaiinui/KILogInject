KILogInject
===========

NSLog() without NSLog()!

```objc
[KILogInject inspect:@selector(doNothing:withString:) of:someObject];
```

Then

```objc
[someObject doNothing:@"Harry" withString:@"Potter"];
```

Will records following logs automatically!

```
2014-08-21 15:29:01.454 LogInject[30278:60b] 
⇢ <KIViewController: 0x8e43400>-doNothing:withString: with (
    Harry,
    Potter
)
2014-08-21 15:29:01.456 LogInject[30278:60b] 
⇠ <KIViewController: 0x8e43400>-doNothing:withString:
```
