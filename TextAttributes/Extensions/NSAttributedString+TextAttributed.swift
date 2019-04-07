//
//  NSAttributedString+TextAttributed.swift
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

public extension NSAttributedString {

    func replace(part: String, with attributesHandler: TextAttributesHandler) -> NSAttributedString {
        return replace(part: part, with: attributesHandler(TextAttributes()))
    }

    func replace(part: String, with attributes: TextAttributed) -> NSAttributedString {
        guard let textToChange = self.mutableCopy() as? NSMutableAttributedString else { return self }

        let range: NSRange = (string as NSString).range(of: part, options: .caseInsensitive)
        let result: NSMutableAttributedString = NSMutableAttributedString(attributedString: textToChange)
        let textAttributes: AttributedStringKeyDictionary = attributes.textAttributes

        result.addAttributes(textAttributes, range: range)

        return NSAttributedString(attributedString: result)
    }
}
