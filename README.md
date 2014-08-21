KILogInject
===========

NSLog() without NSLog()!

```objc
[KILogInject inspect:@selector(doNothing:withString:) of:someObject];
```

Then call the method.

```objc
[someObject doNothing:@"Harry" withString:@"Potter"];
```

Will records following logs automatically! (`doNothing:withString:` does nothing, literally.)

```
2014-08-21 15:29:01.454 LogInject[30278:60b] 
⇢ <KIViewController: 0x8e43400>-doNothing:withString: with (
    Harry,
    Potter
)
2014-08-21 15:29:01.456 LogInject[30278:60b] 
⇠ <KIViewController: 0x8e43400>-doNothing:withString:
```

Or inject instance methods?
---

```objc
[KILogInject inspectInstanceMethods:@selector(doNothing:withString:) of:[Some class]];
```

Then

```objc
[someObject doNothing:@"Harry" withString:@"Potter"];
```

And fun!

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
