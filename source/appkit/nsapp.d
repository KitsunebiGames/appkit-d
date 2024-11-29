/*
    Copyright © 2024, Kitsunebi Games
    Distributed under the 2-Clause BSD License, see LICENSE file.
    
    Authors: Luna Nielsen
*/

/**
    Bindings to NSApplication
*/
module appkit.nsapp;
import appkit.nswindow;
import appkit.nsevent;
import foundation;
import foundation.nserror;
import foundation.nsstring;
import foundation.collections.nsarray;
import objc;

import core.attribute : selector, optional;

extern(Objective-C):

/**
    An abstract class that forms the basis of event and command processing in AppKit.
*/
extern class NSResponder : NSObject {
@nogc nothrow:

    /**
        A Boolean value that indicates whether the responder accepts 
        first responder status.
    */
    @property bool acceptsFirstResponder() const;

    /**
        The next responder after this one, or `null` if it has none.
    */
    @property NSResponder nextResponder();
    @property void nextResponder(NSResponder);

    /**
        Informs the receiver that the user has pressed the left mouse button.
    */
    void onMouseDown(NSEvent event) @selector("mouseDown:");

    /**
        Informs the receiver that the user has moved the mouse with 
        the left button pressed.
    */
    void onMouseDragged(NSEvent event) @selector("mouseDragged:");

    /**
        Informs the receiver that the user has released the left mouse button.
    */
    void onMouseUp(NSEvent event) @selector("mouseUp:");

    /**
        Informs the receiver that the mouse has moved.
    */
    void onMouseMoved(NSEvent event) @selector("mouseMoved:");

    /**
        Informs the receiver that the cursor has entered a tracking rectangle.
    */
    void onMouseEntered(NSEvent event) @selector("mouseEntered:");

    /**
        Informs the receiver that the cursor has exited a tracking rectangle.
    */
    void onMouseExited(NSEvent event) @selector("mouseExited:");

    /**
        Informs the receiver that the user has pressed the right mouse button.
    */
    void onRightMouseDown(NSEvent event) @selector("rightMouseDown:");

    /**
        Informs the receiver that the user has moved the mouse with 
        the right button pressed.
    */
    void onRightMouseDragged(NSEvent event) @selector("rightMouseDragged:");

    /**
        Informs the receiver that the user has released the right mouse button.
    */
    void onRightMouseUp(NSEvent event) @selector("rightMouseUp:");

    /**
        Informs the receiver that the user has pressed a mouse button other 
        than the left or right one.
    */
    void onOtherMouseDown(NSEvent event) @selector("otherMouseDown:");

    /**
        Informs the receiver that the user has moved the mouse with a button other 
        than the left or right button pressed.
    */
    void onOtherMouseDragged(NSEvent event) @selector("otherMouseDragged:");

    /**
        Informs the receiver that the user has released a mouse button other 
        than the left or right button.
    */
    void onOtherMouseUp(NSEvent event) @selector("otherMouseUp:");

    /**
        Informs the receiver that the user has pressed a key.
    */
    void onKeyDown(NSEvent event) @selector("keyDown:");

    /**
        Informs the receiver that the user has released a key.
    */
    void onKeyUp(NSEvent event) @selector("keyUp:");

    /**
        Handles a series of key events.
    */
    void onKeyEvents(NSEvent event) @selector("interpretKeyEvents:");

    /**
        Handle a key equivalent.
    */
    void onKeyEquivalent(NSEvent event) @selector("performKeyEquivalent:");

    /**
        Clears any unprocessed key events when overridden by subclasses.
    */
    void flushBufferedKeyEvents() @selector("flushBufferedKeyEvents");

    /**
        Indicates a pressure change as the result of a user input event on a 
        system that supports pressure sensitivity.
    */
    void onPressureChanged(NSEvent event) @selector("pressureChangeWithEvent:");

    /**
        Informs the receiver that the mouse cursor has moved into a cursor rectangle.
    */
    void onCursorUpdate(NSEvent event) @selector("cursorUpdate:");

    /**
        Informs the receiver that the user has pressed or released a 
        modifier key (Shift, Control, and so on).
    */
    void onFlagsChanged(NSEvent event) @selector("flagsChanged:");

    /**
        Informs the receiver that a tablet-point event has occurred.
    */
    void onTabletPoint(NSEvent event) @selector("tabletPoint:");

    /**
        Informs the receiver that a tablet-proximity event has occurred.
    */
    void onTabletProximity(NSEvent event) @selector("tabletProximity:");

    /**
        Displays context-sensitive help for the receiver if help 
        has been registered.
    */
    void onHelpRequested(NSEvent event) @selector("helpRequested:");

    /**
        Informs the receiver that the mouse’s scroll wheel has moved.
    */
    void onScrollWheel(NSEvent event) @selector("scrollWheel:");

    /**
        Performs a Quick Look on the content at the location 
        specified by the supplied event.
    */
    void onQuickLook(NSEvent event) @selector("quickLookWithEvent:");

    /**
        Informs the responder that performed a double-tap on 
        the side of an Apple Pencil.
    */
    void onModeChanged(NSEvent event) @selector("changeModeWithEvent:");

    /**
        Presents an error alert to the user as an application-modal dialog.
    */
    void presentError(NSError error) @selector("presentError:");

    /**
        Allows controls to determine when they should become first responder.
    */
    bool becomeFirstResponder(NSResponder responder, NSEvent event) @selector("validateProposedFirstResponder:forEvent:");

    /**
        Notifies the receiver that it’s about to become first responder in its NSWindow.
    */
    bool becomeFirstResponder() @selector("becomeFirstResponder");

    /**
        Notifies the receiver that it’s been asked to relinquish its status 
        as first responder in its window.
    */
    bool resignFirstResponder() @selector("resignFirstResponder");
}

/**
    An object that manages an app’s main event loop and resources 
    used by all of that app’s objects.
*/
extern class NSApplication : NSObject {
@nogc nothrow:
    
    /**
        Returns the application instance, creating it if it doesn’t exist yet.
    */
    static @property NSApplication sharedApplication();

    /**
        A Boolean value indicating whether this is the active app.
    */
    @property bool isActive() const;

    /**
        An array of window objects arranged according to their 
        front-to-back ordering on the screen.
    */
    @property NSArray!NSWindow orderedWindows() const;

    /**
        Activates the receiver app, if appropriate.
    */
    void activate() @selector("activate");

    /**
        Deactivates the receiver.
    */
    void deactivate() @selector("deactivate");

    /**
        Starts the main event loop.
    */
    void run() @selector("run");

    /**
        Activates the app, opens any files specified by the NSOpen user default, 
        and unhighlights the app’s icon.
    */
    void finishLaunching() @selector("finishLaunching");

    /**
        Stops the main event loop.
    */
    void stop(id sender) @selector("stop:");

    /**
        Terminates the receiver.
    */
    void terminate(id sender) @selector("terminate:");

    /**
        Dispatches an event to other objects.
    */
    void sendEvent(NSEvent event) @selector("sendEvent:");

    /**
        Adds a given event to the receiver’s event queue.
    */
    void postEvent(NSEvent event, bool atStart) @selector("postEvent:atStart:");

    /**
        Disables relaunching the app on login.
    */
    void disableRelaunchOnLogin() @selector("disableRelaunchOnLogin");

    /**
        Enables relaunching the app on login.
    */
    void enableRelaunchOnLogin() @selector("enableRelaunchOnLogin");
}

/**
    The global variable for the shared app instance.
*/
extern(C) extern __gshared NSApplication NSApp; // @suppress(dscanner.style.phobos_naming_convention)

/**
    Startup function to call when running Cocoa code from a Carbon application.
*/
@system
extern(C) extern bool NSApplicationLoad(); // @suppress(dscanner.style.phobos_naming_convention)