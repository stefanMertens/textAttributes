//
//  TextAttributed.swift
//
//  Copyright (c) 2019 by Stefan Mertens.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

import Foundation
import UIKit

public protocol TextAttributed {

    var textAttributes: AttributedStringKeyDictionary { get }
}

// Example

class vc: UIViewController {

    override func viewDidLoad() {
        let label: UILabel = UILabel()

        // Add attributes like this:

        let attributes = TextAttributes {
            return $0.backgroundColor(.red)
                     .strokeColor(.green)
        }
        label.attributedText = "some text".attributed(with: attributes)


        // or like this, while showing the replace functinality:

        let otherAttributes = TextAttributes(types: [ .font(UIFont.systemFont(ofSize: 14)),
                                                      .textColor(.blue) ])

        label.attributedText = label.attributedText?.replace(part: "text", with: otherAttributes)
    }
}
