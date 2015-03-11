//
//  ViewController.swift
//  ActionsAndOutlets
//
//  Created by Chrisna Aing on 3/10/15.
//  Copyright (c) 2015 Chrisna Aing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Outlet Collection

    // Order is not guaranteed in outlet collections. And, things should be private whenever it's
    // possible to make them private!

    @IBOutlet private var switches: [UISwitch]!

    // MARK: - First

    @IBAction private func myAction(sender: AnyObject) {
        // This is the default configuration of an action. Note that sender is an object of type
        // AnyObject, which, if you want to use the sender, is probably not what you want. This is
        // because AnyObject allows anything to happen. The code below, if uncommented, will crash
        // because sender is a UIButton, not a UISwitch:
        // sender.setOn(true, animated: true)
    }

    @IBAction private func myActionImproved(sender: UIButton) {
        // Much better! Now the compiler will warn us if we try what we did above. This is also an
        // example of why having the sender is useful: sometimes, we need to modify it in some way.
        sender.setTitle("First!", forState: .Normal)
    }

    // MARK: - Second

    // A button can be tied to multiple actions, as seen below (and above too, actually). The extra
    // wrinkle with the actions below is that the first one is triggered when the event is "touch up
    // outside" whereas the second one is triggered when the event is "touch up inside."

    // Also, to better align with best practices, we do not pass an argument into the action because
    // we don't need one.

    @IBAction private func touchOutside() {
        println("Touch up outside!")
    }

    @IBAction private func touch() {
        println("Touch up inside!")
    }

    // MARK: - Third

    // Passing in the event can be helpful if you want very specific information about a user's
    // interaction with the screen.

    @IBAction private func thirdAction(sender: UIButton, forEvent event: UIEvent) {
        // This doesn't work in Swift 1.2 / Xcode 6.3 because allTouches() returns a Swift Set (a
        // new collection type in Swift 1.2) rather than an NSSet (an artifact of Objective-C and
        // Foundation, like NSArray and NSDictionary).
        if let touches = event.allTouches()?.allObjects as? [UITouch] {
            for touch in touches {
                println(touch.locationInView(self.view))
            }
        }
    }

    // MARK: - Toggling

    // Instead of doing this with individual outlets, we can create an outlet collection and iterate
    // through the list of UISwitches. This is way cleaner and less error-prone as well.

    @IBAction private func toggleOn() {
        for s in switches {
            s.setOn(true, animated: true)
        }
    }

    @IBAction private func toggleOff() {
        for s in switches {
            s.setOn(false, animated: true)
        }
    }

}
