//
//  AttributedText.swift
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

public struct TextAttributes: TextAttributed {

    // MARK: - Public Properties

    public var textAttributes: AttributedStringKeyDictionary {
        return attributesDictionary
    }

    // MARK: - Private Properties

    private var attributesDictionary: AttributedStringKeyDictionary

    // MARK: - Public Inits

    public init() {
        self.attributesDictionary = [ : ]
    }

    public init(_ attributesHandler: TextAttributesHandler) {
        self = attributesHandler(TextAttributes())
    }

    public init(type: TextAttributesType) {
        self.attributesDictionary = type.textAttributes
    }

    public init(types: [TextAttributesType]) {
        var dictionary: AttributedStringKeyDictionary = [ : ]

        types.forEach {
            for (key, value) in $0.textAttributes {
                dictionary[key] = value
            }
        }

        self.attributesDictionary = dictionary
    }

    // MARK: - Private Init

    internal init(dictionary: AttributedStringKeyDictionary) {
        self.attributesDictionary = dictionary
    }
}

// MARK: - Merge Method

extension TextAttributes {

    // MARK: - Private Methods

    private func merged(with type: TextAttributesType) -> TextAttributes {

        // merge attributes first
        let attributes: TextAttributes = TextAttributes(dictionary: type.textAttributes)

        var oldDictionary: AttributedStringKeyDictionary = textAttributes
        let newDictionary: AttributedStringKeyDictionary = attributes.textAttributes

        for (key, value) in newDictionary {
            oldDictionary[key] = value
        }

        // merge paragraph styles
        let defaultParagraphStyle: NSParagraphStyle = NSParagraphStyle.default
        let newParagraphStyle: NSMutableParagraphStyle = attributes.currentParagraphStyle
        let combinedParagraphStyles: NSMutableParagraphStyle = currentParagraphStyle

        if newParagraphStyle.alignment != defaultParagraphStyle.alignment {
            combinedParagraphStyles.alignment = newParagraphStyle.alignment
        }

        if newParagraphStyle.baseWritingDirection != defaultParagraphStyle.baseWritingDirection {
            combinedParagraphStyles.baseWritingDirection = newParagraphStyle.baseWritingDirection
        }

        if newParagraphStyle.firstLineHeadIndent != defaultParagraphStyle.firstLineHeadIndent {
            combinedParagraphStyles.firstLineHeadIndent = newParagraphStyle.firstLineHeadIndent
        }

        if newParagraphStyle.headIndent != defaultParagraphStyle.headIndent {
            combinedParagraphStyles.headIndent = newParagraphStyle.headIndent
        }

        if newParagraphStyle.hyphenationFactor != defaultParagraphStyle.hyphenationFactor {
            combinedParagraphStyles.hyphenationFactor = newParagraphStyle.hyphenationFactor
        }

        if newParagraphStyle.lineHeightMultiple != defaultParagraphStyle.lineHeightMultiple {
            combinedParagraphStyles.lineHeightMultiple = newParagraphStyle.lineHeightMultiple
        }

        if newParagraphStyle.lineBreakMode != defaultParagraphStyle.lineBreakMode {
            combinedParagraphStyles.lineBreakMode = newParagraphStyle.lineBreakMode
        }

        if newParagraphStyle.lineSpacing != defaultParagraphStyle.lineSpacing {
            combinedParagraphStyles.lineSpacing = newParagraphStyle.lineSpacing
        }

        if newParagraphStyle.minimumLineHeight != defaultParagraphStyle.minimumLineHeight {
            combinedParagraphStyles.minimumLineHeight = newParagraphStyle.minimumLineHeight
        }

        if newParagraphStyle.maximumLineHeight != defaultParagraphStyle.maximumLineHeight {
            combinedParagraphStyles.maximumLineHeight = newParagraphStyle.maximumLineHeight
        }

        if newParagraphStyle.paragraphSpacing != defaultParagraphStyle.paragraphSpacing {
            combinedParagraphStyles.paragraphSpacing = newParagraphStyle.paragraphSpacing
        }

        if newParagraphStyle.paragraphSpacingBefore != defaultParagraphStyle.paragraphSpacingBefore {
            combinedParagraphStyles.paragraphSpacingBefore = newParagraphStyle.paragraphSpacingBefore
        }

        if newParagraphStyle.tailIndent != defaultParagraphStyle.tailIndent {
            combinedParagraphStyles.tailIndent = newParagraphStyle.tailIndent
        }

        oldDictionary[AttributedStringKey.paragraphStyle] = combinedParagraphStyles

        return TextAttributes(dictionary: oldDictionary)
    }
}

// MARK: - Attributes

extension TextAttributes {

    public func attachment(_ attachment: NSTextAttachment) -> TextAttributes {
        return self.merged(with: .attachment(attachment))
    }

    public func backgroundColor(_ color: UIColor) -> TextAttributes {
        return self.merged(with: .backgroundColor(color))
    }

    public func baselineOffset(_ offset: NSNumber) -> TextAttributes {
        return self.merged(with: .baselineOffset(offset))
    }

    public func font(_ font: UIFont) -> TextAttributes {
        return self.merged(with: .font(font))
    }

    public func kerning(_ kerning: Double) -> TextAttributes {
        return self.merged(with: .kerning(kerning))
    }

    public func link(_ link: NSURL) -> TextAttributes {
        return self.merged(with: .link(link))
    }

    public func obliqueness(_ value: CGFloat) -> TextAttributes {
        return self.merged(with: .obliqueness(value))
    }

    public func paragraphStyle(_ style: NSParagraphStyle) -> TextAttributes {
        return self.merged(with: .paragraphStyle(style))
    }

    public func shadow(_ shadow: NSShadow) -> TextAttributes {
        return self.merged(with: .shadow(shadow))
    }

    public func strikeThroughStyle(_ style: NSUnderlineStyle) -> TextAttributes {
        return self.merged(with: .strikeThroughStyle(style)).merged(with: .baselineOffset(1.5))
    }

    public func strokeColor(_ color: UIColor) -> TextAttributes {
        return self.merged(with: .strokeColor(color))
    }

    public func strokeWidth(_ width: NSNumber) -> TextAttributes {
        return self.merged(with: .strokeWidth(width))
    }

    public func textColor(_ color: UIColor) -> TextAttributes {
        return self.merged(with: .textColor(color))
    }

    public func underlineColor(_ color: UIColor) -> TextAttributes {
        return self.merged(with: .underlineColor(color))
    }

    public func underlineStyle(_ style: NSUnderlineStyle) -> TextAttributes {
        return self.merged(with: .underlineStyle(style))
    }
}

// MARK: - ParagraphStyles

extension TextAttributes {

    private var currentParagraphStyle: NSMutableParagraphStyle {
        guard let paragraphyStyle = textAttributes[AttributedStringKey.paragraphStyle] as? NSMutableParagraphStyle  else {
            return NSMutableParagraphStyle.default.mutableCopy() as? NSMutableParagraphStyle ?? NSMutableParagraphStyle()
        }
        return paragraphyStyle
    }

    public func alignment(_ alignment: NSTextAlignment) -> TextAttributes {
        let paragraphStyle: NSMutableParagraphStyle = currentParagraphStyle
        paragraphStyle.alignment = alignment
        return self.merged(with: .paragraphStyle(paragraphStyle))
    }

    public func baseWritingDirection(_ direction: NSWritingDirection) -> TextAttributes {
        let paragraphStyle: NSMutableParagraphStyle = currentParagraphStyle
        paragraphStyle.baseWritingDirection = direction
        return self.merged(with: .paragraphStyle(paragraphStyle))
    }

    public func firstLineHeadIndent(_ indent: CGFloat) -> TextAttributes {
        let paragraphStyle: NSMutableParagraphStyle = currentParagraphStyle
        paragraphStyle.firstLineHeadIndent = indent
        return self.merged(with: .paragraphStyle(paragraphStyle))
    }

    public func headIndent(_ indent: CGFloat) -> TextAttributes {
        let paragraphStyle: NSMutableParagraphStyle = currentParagraphStyle
        paragraphStyle.headIndent = indent
        return self.merged(with: .paragraphStyle(paragraphStyle))
    }

    public func hyphenationFactor(_ factor: Float) -> TextAttributes {
        let paragraphStyle: NSMutableParagraphStyle = currentParagraphStyle
        paragraphStyle.hyphenationFactor = factor
        return self.merged(with: .paragraphStyle(paragraphStyle))
    }

    public func lineBreakMode(_ lineBreakMode: NSLineBreakMode) -> TextAttributes {
        let paragraphStyle: NSMutableParagraphStyle = currentParagraphStyle
        paragraphStyle.lineBreakMode = lineBreakMode
        return self.merged(with: .paragraphStyle(paragraphStyle))
    }

    public func lineHeightMultiple(_ lineHeight: CGFloat) -> TextAttributes {
        let paragraphStyle: NSMutableParagraphStyle = currentParagraphStyle
        paragraphStyle.lineHeightMultiple = lineHeight
        return self.merged(with: .paragraphStyle(paragraphStyle))
    }

    public func lineSpacing(_ lineSpacing: CGFloat) -> TextAttributes {
        let paragraphStyle: NSMutableParagraphStyle = currentParagraphStyle
        paragraphStyle.lineSpacing = lineSpacing
        return self.merged(with: .paragraphStyle(paragraphStyle))
    }

    public func minimumLineHeight(_ lineHeight: CGFloat) -> TextAttributes {
        let paragraphStyle: NSMutableParagraphStyle = currentParagraphStyle
        paragraphStyle.minimumLineHeight = lineHeight
        return self.merged(with: .paragraphStyle(paragraphStyle))
    }

    public func maximumLineHeight(_ lineHeight: CGFloat) -> TextAttributes {
        let paragraphStyle: NSMutableParagraphStyle = currentParagraphStyle
        paragraphStyle.maximumLineHeight = lineHeight
        return self.merged(with: .paragraphStyle(paragraphStyle))
    }

    public func paragraphSpacing(_ spacing: CGFloat) -> TextAttributes {
        let paragraphStyle: NSMutableParagraphStyle = currentParagraphStyle
        paragraphStyle.paragraphSpacing = spacing
        return self.merged(with: .paragraphStyle(paragraphStyle))
    }

    public func paragraphSpacingBefore(_ spacing: CGFloat) -> TextAttributes {
        let paragraphStyle: NSMutableParagraphStyle = currentParagraphStyle
        paragraphStyle.paragraphSpacingBefore = spacing
        return self.merged(with: .paragraphStyle(paragraphStyle))
    }

    public func tailIndent(_ indent: CGFloat) -> TextAttributes {
        let paragraphStyle: NSMutableParagraphStyle = currentParagraphStyle
        paragraphStyle.tailIndent = indent
        return self.merged(with: .paragraphStyle(paragraphStyle))
    }

    public func uniformLineHeight(_ lineHeight: CGFloat) -> TextAttributes {
        return maximumLineHeight(lineHeight).minimumLineHeight(lineHeight)
    }
}
