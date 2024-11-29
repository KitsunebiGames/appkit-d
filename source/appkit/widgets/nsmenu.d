/*
    Copyright © 2024, Kitsunebi Games
    Distributed under the 2-Clause BSD License, see LICENSE file.
    
    Authors: Luna Nielsen
*/

/**
    Bindings to NSMenu
*/
module appkit.widgets.nsmenu;
import appkit.widgets;
import appkit.nsevent;
import foundation.nscoder;
import foundation.nsstring;
import objc;

import core.attribute : selector, optional;

extern(Objective-C):

/**
    An object that manages an app’s menus.
*/
extern class NSMenu : NSObject {
nothrow @nogc:

    /**
        Returns a new instance of the receiving class.
    */
    override
    static NSMenu alloc() @selector("alloc");

    /**
        Implemented by subclasses to initialize a new object (the receiver) 
        immediately after memory for it has been allocated.
    */
    override
    NSMenu init() @selector("init");

    /**
        Displays a contextual menu over a view for an event.
    */
    static void openPopup(NSMenu menu, NSEvent event, NSView view) @selector("popUpContextMenu:withEvent:forView:");

    /**
        Initializes and returns a menu having the specified title and 
        with autoenabling of menu items turned on.
    */
    NSMenu init(NSString title) @selector("initWithTitle:");

    /**
        Initializes and returns a menu using the specfied coder.
    */
    NSMenu init(NSCoder coder) @selector("initWithCoder:");

    /**
        A Boolean value that indicates whether the menu bar is visible.
    */
    static @property bool menuBarVisible();
    static @property void menuBarVisible(bool);

    /**
        The menu bar height for the main menu in pixels.
    */
    @property CGFloat menuBarHeight();
    @property void menuBarHeight(CGFloat);

    /**
        The title of the menu.
    */
    @property NSString title();
    @property void title(NSString);

    /**
        The minimum width of the menu in screen coordinates.
    */
    @property CGFloat minimumWidth();
    @property void minimumWidth(CGFloat);

    /**
        Inserts a menu item into the menu at a specific location.
    */
    void insert(NSMenuItem item, NSInteger index) @selector("insertItem:atIndex:");

    /**
        Creates and adds a menu item at a specified location in the menu.
    */
    NSMenuItem insert(NSString title, SEL selector, NSString keyEquivalent, NSInteger index) @selector("insertItemWithTitle:action:keyEquivalent:atIndex:");

    /**
        Adds a menu item to the end of the menu.
    */
    void add(NSMenuItem item) @selector("addItem:");

    /**
        Creates a new menu item and adds it to the end of the menu.
    */
    NSMenuItem add(NSString title, SEL selector, NSString keyEquivalent) @selector("addItemWithTitle:action:keyEquivalent:");

    /**
        Removes a menu item from the menu.
    */
    void remove(NSMenuItem item) @selector("removeItem:");

    /**
        Removes the menu item at a specified location in the menu.
    */
    void remove(NSInteger index) @selector("removeItemAtIndex:");

    /**
        Removes all the menu items in the menu.
    */
    void removeAll() @selector("removeAllItems");

    /**
        Enables or disables the menu items of the menu based on the NSMenuValidation 
        informal protocol and sizes the menu to fit its current menu items if necessary.
    */
    void update() @selector("update");

    /**
        Invoked when a menu item is modified visually (for example, its title changes).
    */
    void onItemChanged(NSMenuItem item) @selector("itemChanged:");
    
}

/**
    A command item in an app menu.
*/
extern class NSMenuItem : NSObject {

    /**
        A Boolean value that indicates whether the menu item is enabled.
    */
    @property bool enabled() @selector("isEnabled");
    @property void enabled(bool);

    /**
        A Boolean value that indicates whether the menu item is hidden.
    */
    @property bool hidden() @selector("isHidden");
    @property void hidden(bool);

    /**
        A Boolean value that indicates whether the menu item or any of its superitems is hidden.
    */
    @property bool hiddenOrHasHiddenAncestor() @selector("isHiddenOrHasHiddenAncestor");

    /**
        The menu item’s target.
    */
    @property id target();
    @property void target(id);

    /**
        The menu item’s action-method selector.
    */
    @property SEL action();
    @property void action(SEL);

    /**
        The menu item’s title.
    */
    @property NSString title();
    @property void title(NSString);

    /**
        A custom string for a menu item.
    */
    @property NSString attributedTitle();
    @property void attributedTitle(NSString);

    /**
        The menu item’s tag.
    */
    @property NSInteger tag();
    @property void tag(NSInteger);

    /**
        The state of the menu item.
    */
    @property NSControlStateValue state();
    @property void state(NSControlStateValue);

    /**
        The state of the menu item.
    */
    @property bool isSectionHeader() @selector("isSectionHeader");
    @property void isSectionHeader(bool) @selector("setSectionHeader:");

    /**
        Returns a menu item representing a section header for a 
        logical grouping of menu commands.
    */
    static NSMenuItem createSectionHeaderWithTitle(NSString title) @selector("sectionHeaderWithTitle:");

    /**
        The submenu of the menu item.
    */
    @property NSMenu submenu();
    @property void submenu(NSMenu);

    /**
        A Boolean value that indicates whether the menu item has a submenu.
    */
    @property bool hasSubmenu() const;

    /**
        A Boolean value that indicates whether the menu item has a submenu.
    */
    @property NSMenuItem parentItem() const;

    /**
        The state of the menu item.
    */
    @property bool isSeparatorItem() @selector("isSeparatorItem");
    @property void isSeparatorItem(bool) @selector("setSeparatorItem:");

    /**
        Returns a menu item that is used to separate logical groups of menu commands.
    */
    static NSMenuItem createSeperatorItem() @selector("separatorItem");

    /**
        The menu item’s menu.
    */
    @property NSMenu menu();
    @property void menu(NSMenu);

    /**
        The menu item’s unmodified key equivalent.
    */
    @property NSString keyEquivalent();
    @property void keyEquivalent(NSString);

    /**
        The menu item indentation level for the menu item.
    */
    @property NSInteger indentationLevel();
    @property void indentationLevel(NSInteger);

    /**
        A help tag for the menu item.
    */
    @property NSString toolTip();
    @property void toolTip(NSString);

    /**
        The object represented by the menu item.

        By setting a represented object for a menu item, you make an association 
        between the menu item and that object. 

        The represented object functions as a more specific form of tag that allows you to 
        associate any object, not just an arbitrary integer, with the items in a menu.
    */
    @property id representedObject();
    @property void representedObject(id);

    /**
        A Boolean value that indicates whether the menu item should be drawn highlighted.
    */
    @property bool isHighlighted() const;

    /**
        Used to specify a standard subtitle for the menu item.

        The subtitle is displayed below the standard title.
    
        ### NOTE
        > On macOS 14, a menu item with an attributed title does not show the subtitle.  
        > The subtitle is shown on macOS 15 and later.
    */
    @property NSString subtitle();
    @property void subtitle(NSString);
}