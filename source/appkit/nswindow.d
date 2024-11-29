/*
    Copyright © 2024, Kitsunebi Games
    Distributed under the 2-Clause BSD License, see LICENSE file.
    
    Authors: Luna Nielsen
*/

/**
    Bindings to NSApplication
*/
module appkit.nswindow;
import appkit.nsapp;
import appkit.nsevent;
import foundation;
import foundation.nserror;
import objc;

import core.attribute : selector, optional;

extern(Objective-C):


/**
    An object that contains information about an input action, 
    such as a mouse click or a key press.
*/
extern class NSWindow : NSResponder {
@nogc nothrow:
public:

}