/*
    Copyright © 2024, Kitsunebi Games
    Distributed under the 2-Clause BSD License, see LICENSE file.
    
    Authors: Luna Nielsen
*/

/**
    Bindings to NSView
*/
module appkit.widgets.nsview;
import appkit.widgets;
import appkit.nsevent;
import appkit.nsapp;
import foundation.nscoder;
import foundation.nsstring;
import objc;

import core.attribute : selector, optional;

extern(Objective-C):

/**
    The infrastructure for drawing, printing, and handling events in an app.
*/
extern class NSView : NSResponder {

}