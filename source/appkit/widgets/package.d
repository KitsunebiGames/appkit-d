/*
    Copyright © 2024, Kitsunebi Games
    Distributed under the 2-Clause BSD License, see LICENSE file.
    
    Authors: Luna Nielsen
*/

/**
    Bindings to AppKit widgets
*/
module appkit.widgets.nsmenu;
import objc;

public import coregraphics.cggeometry;
public import coregraphics;
public import foundation;

public import appkit.widgets.nsmenu;
public import appkit.widgets.nsview;

/**
    A constant that indicates whether a control is on, off, or in a mixed state.
*/
alias NSControlStateValue = NSInteger;

extern(C) nothrow @nogc:

/**
    A constant value that indicates a control is on or selected.
*/
extern __gshared const NSControlStateValue NSControlStateValueOn;

/**
    A constant value that indicates a control is off or unselected.
*/
extern __gshared const NSControlStateValue NSControlStateValueOff;

/**
    A constant value that indicates a control is in a mixed state, 
    neither on nor off.
*/
extern __gshared const NSControlStateValue NSControlStateValueMixed;