//
//  TextAttributesType.swift
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

import UIKit

public enum TextAttributesType {

    // textAttributes
    case attachment(NSTextAttachment)
    case backgroundColor(UIColor)
    case baselineOffset(NSNumber)
    case font(UIFont)
    case kerning(Double)
    case link(NSURL)
    case obliqueness(CGFloat)
    case paragraphStyle(NSParagraphStyle)
    case shadow(NSShadow)
    case strikeThroughStyle(NSUnderlineStyle)
    case strokeColor(UIColor)
    case strokeWidth(NSNumber)
    case textColor(UIColor)
    case underlineColor(UIColor)
    case underlineStyle(NSUnderlineStyle)

    // paragraphStyles
    case alignment(NSTextAlignment)
    case baseWritingDirection(NSWritingDirection)
    case firstLineIndent(CGFloat)
    case headIndent(CGFloat)
    case hyphenationFactor(Float)
    case lineBreakMode(NSLineBreakMode)
    case lineHeightMultiple(CGFloat)
    case lineSpacing(CGFloat)
    case minimumLineHeight(CGFloat)
    case maximumLineHeight(CGFloat)
    case paragraphSpacing(CGFloat)
    case paragraphSpacingBefore(CGFloat)
    case tailIndent(CGFloat)
    case uniformLineHeight(CGFloat)
}
