//
//  TextAttributesType+TextAttributed.swift
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

extension TextAttributesType: TextAttributed {

    public var textAttributes: AttributedStringKeyDictionary {
        switch self {

        // textAttributes
        case .attachment(let attachment):
            return [AttributedStringKey.attachment : attachment]
        case .backgroundColor(let color):
            return [AttributedStringKey.backgroundColor : color]
        case .baselineOffset(let offset):
            return [AttributedStringKey.baselineOffset : offset]
        case .font(let font):
            return [AttributedStringKey.font : font]
        case .kerning(let kerning):
            return [AttributedStringKey.kern : NSNumber(floatLiteral: kerning)]
        case .link(let url):
            return [AttributedStringKey.link : url]
        case .obliqueness(let value):
            return [AttributedStringKey.obliqueness : value ]
        case .paragraphStyle(let paragraphStyle):
            return [AttributedStringKey.paragraphStyle : paragraphStyle]
        case .shadow(let shadow):
            return [AttributedStringKey.shadow : shadow ]
        case .strikeThroughStyle(let style):
            return [AttributedStringKey.strikethroughStyle : style.rawValue ]
        case .strokeColor(let color):
            return [AttributedStringKey.strokeColor : color]
        case .strokeWidth(let width):
            return [AttributedStringKey.strokeWidth : width]
        case .textColor(let color):
            return [AttributedStringKey.foregroundColor : color]
        case .underlineColor(let color):
            return [AttributedStringKey.underlineColor : color]
        case .underlineStyle(let style):
            return [AttributedStringKey.underlineStyle : style.rawValue]

        // pararaphyStyles
        case .alignment(let alignment):
            let style = NSMutableParagraphStyle()
            style.alignment = alignment
            return convertedParagraphStyle(style)
        case .baseWritingDirection(let writingDirection):
            let style = NSMutableParagraphStyle()
            style.baseWritingDirection = writingDirection
            return convertedParagraphStyle(style)
        case .firstLineIndent(let indent):
            let style = NSMutableParagraphStyle()
            style.firstLineHeadIndent = indent
            return convertedParagraphStyle(style)
        case .headIndent(let indent):
            let style = NSMutableParagraphStyle()
            style.headIndent = indent
            return convertedParagraphStyle(style)
        case .hyphenationFactor(let factor):
            let style = NSMutableParagraphStyle()
            style.hyphenationFactor = factor
            return convertedParagraphStyle(style)
        case .lineBreakMode(let lineBreakMode):
            let style = NSMutableParagraphStyle()
            style.lineBreakMode = lineBreakMode
            return convertedParagraphStyle(style)
        case .lineHeightMultiple(let lineHeight):
            let style = NSMutableParagraphStyle()
            style.lineHeightMultiple = lineHeight
            return convertedParagraphStyle(style)
        case .lineSpacing(let spacing):
            let style = NSMutableParagraphStyle()
            style.lineSpacing = spacing
            return convertedParagraphStyle(style)
        case .minimumLineHeight(let lineHeight):
            let style = NSMutableParagraphStyle()
            style.minimumLineHeight = lineHeight
            return convertedParagraphStyle(style)
        case .maximumLineHeight(let lineHeight):
            let style = NSMutableParagraphStyle()
            style.maximumLineHeight = lineHeight
            return convertedParagraphStyle(style)
        case .paragraphSpacing(let spacing):
            let style = NSMutableParagraphStyle()
            style.paragraphSpacing = spacing
            return convertedParagraphStyle(style)
        case .paragraphSpacingBefore(let spacing):
            let style = NSMutableParagraphStyle()
            style.paragraphSpacingBefore = spacing
            return convertedParagraphStyle(style)
        case .tailIndent(let indent):
            let style = NSMutableParagraphStyle()
            style.tailIndent = indent
            return convertedParagraphStyle(style)
        case .uniformLineHeight(let lineHeight):
            let style = NSMutableParagraphStyle()
            style.maximumLineHeight = lineHeight
            style.minimumLineHeight = lineHeight
            return convertedParagraphStyle(style)
        }
    }

    private func convertedParagraphStyle(_ style: NSMutableParagraphStyle) -> AttributedStringKeyDictionary {
        return [AttributedStringKey.paragraphStyle : style]
    }
}
