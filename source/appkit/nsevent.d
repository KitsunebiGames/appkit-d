/*
    Copyright © 2024, Kitsunebi Games
    Distributed under the 2-Clause BSD License, see LICENSE file.
    
    Authors: Luna Nielsen
*/

/**
    Bindings to NSEvent
*/
module appkit.nsevent;
import foundation;
import objc;

import core.attribute : selector, optional;

extern(Objective-C):


/**
    An object that contains information about an input action, 
    such as a mouse click or a key press.
*/
extern class NSEvent : NSObject {

}