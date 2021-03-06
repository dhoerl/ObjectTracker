ObjectTracker
=============

When you create your own subclasses, it's easy to add a log message to the "dealloc" method, to verify that in fact the object has been dealloced when expected. But what about other system classes, particularly those that are not designed to be subclassed. Other than poking around Instruments's ObjectAllocation, it's virtually impossible to see when such objects are deallocated.

But no more! With ObjectTracker, you can tag any object you want, and when its dealloced you will see:

- a msg that you tagged the object with
- how long the object lived
- the decription of the object at the time you tracked it
- whether the object was created on the main thread but dealloced on a different thread, or vice versa

Usage:

- import Tracker.h in your pch file
- use this line to track an object: "[Tracker trackerWithObject:obj msg:@"Some Msg"];

Notes:

1) Duplicate track requests on the same object cause the older request to be replaced with the newer one.

License:

//
// ObjectTracker (TM)
// Copyright (C) 2013 by David Hoerl
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//
