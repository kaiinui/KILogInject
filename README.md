KILogInject
===========

NSLog() without NSLog()!

```
2014-08-21 18:48:02.789 SomeApp[32613:60b] 
<SomeClass: 0x8d1a810> ⇢ -doNothing:withString:(
    Harry,
    Potter
)
2014-08-21 18:48:03.792 SomeApp[32613:60b] 
<SomeClass: 0x8d1a810> ⇠ -doNothing:withString: [87ms] = someargsomeString
```

To inject the logger, call following method of the injector.

```objc
[KILogInject inspect:@selector(doNothing:withString:) of:someObject];
```

Then call the method of injected object. (Please note, `doNothing:withString:` does nothing, literally.)

```objc
[someObject doNothing:@"Harry" withString:@"Potter"];
```

Or inject a Class?
---

```objc
[KILogInject inspectInstanceMethods:@selector(doNothing:withString:) of:[SomeClass class]];
```

Then

```objc
[someObject doNothing:@"Harry" withString:@"Potter"];
```

:sushi:

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
