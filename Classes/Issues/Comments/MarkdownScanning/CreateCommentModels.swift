//
//  CreateCommentModels.swift
//  Freetime
//
//  Created by Ryan Nystrom on 5/24/17.
//  Copyright © 2017 Ryan Nystrom. All rights reserved.
//

import Foundation
import CocoaMarkdown
import IGListKit

private func bodyString(
    body: String,
    width: CGFloat,
    start: Int,
    end: Int
    ) -> NSAttributedStringSizing? {
    guard
        end > 0,
        end - start > 0,
        let between = body
            .substring(with: NSRange(location: start, length: end - start))?
            .trimmingCharacters(in: .whitespacesAndNewlines),
        between.characters.count > 0,
        let textAttributes = CMTextAttributes()
        else { return nil }

    textAttributes.textAttributes = [
        NSForegroundColorAttributeName: Styles.Colors.Gray.dark,
        NSFontAttributeName: Styles.Fonts.body,
    ]
    textAttributes.linkAttributes = [
        NSForegroundColorAttributeName: Styles.Colors.Blue.medium,
    ]
    textAttributes.inlineCodeAttributes = [
        NSForegroundColorAttributeName: Styles.Colors.Gray.dark,
        NSBackgroundColorAttributeName: Styles.Colors.Gray.lighter,
        NSFontAttributeName: Styles.Fonts.code,
    ]
    textAttributes.orderedListAttributes = [
        NSParagraphStyleAttributeName: NSParagraphStyle(),
    ]
    textAttributes.unorderedListAttributes = [
        NSParagraphStyleAttributeName: NSParagraphStyle(),
    ]

    let headerParaStyle = NSMutableParagraphStyle()
    headerParaStyle.paragraphSpacingBefore = 8

    textAttributes.h1Attributes = [
        NSParagraphStyleAttributeName: headerParaStyle,
        NSForegroundColorAttributeName: Styles.Colors.Gray.dark,
        NSFontAttributeName: UIFont.boldSystemFont(ofSize: 24),
    ]
    textAttributes.h2Attributes = [
        NSParagraphStyleAttributeName: headerParaStyle,
        NSForegroundColorAttributeName: Styles.Colors.Gray.dark,
        NSFontAttributeName: UIFont.boldSystemFont(ofSize: 22),
    ]
    textAttributes.h3Attributes = [
        NSParagraphStyleAttributeName: headerParaStyle,
        NSForegroundColorAttributeName: Styles.Colors.Gray.dark,
        NSFontAttributeName: UIFont.boldSystemFont(ofSize: 20),
    ]
    textAttributes.h4Attributes = [
        NSParagraphStyleAttributeName: headerParaStyle,
        NSForegroundColorAttributeName: Styles.Colors.Gray.dark,
        NSFontAttributeName: UIFont.boldSystemFont(ofSize: 18),
    ]
    textAttributes.h5Attributes = [
        NSParagraphStyleAttributeName: headerParaStyle,
        NSForegroundColorAttributeName: Styles.Colors.Gray.dark,
        NSFontAttributeName: UIFont.boldSystemFont(ofSize: 16),
    ]
    textAttributes.h6Attributes = [
        NSParagraphStyleAttributeName: headerParaStyle,
        NSForegroundColorAttributeName: Styles.Colors.Gray.medium,
        NSFontAttributeName: UIFont.boldSystemFont(ofSize: 16),
    ]

    return CreateMarkdownString(
        body: between,
        width: width,
        attributes: textAttributes,
        inset: IssueCommentTextCell.inset
    )
}

func createCommentModels(body: String, width: CGFloat) -> [IGListDiffable] {

    let newlineCleanedBody = body.replacingOccurrences(of: "\r\n", with: "\n")

    var scannerResults = [(NSRange, IGListDiffable)]()
    let scanners = [
        imageScanner,
        codeBlockScanner,
        detailsScanner,
        quoteScanner
    ]
    for scanner in scanners {
        scannerResults += scanner.handler(newlineCleanedBody, width)
    }
    scannerResults.sort { $0.0.location < $1.0.location }

    var results = [IGListDiffable]()
    var location = 0
    for (range, model) in scannerResults {
        guard range.location >= location else { continue }

        if let sizing = bodyString(body: newlineCleanedBody, width: width, start: location, end: range.location) {
            results.append(sizing)
        }

        location = range.location + range.length

        results.append(model)
    }

    let end = newlineCleanedBody.utf16.count
    if let remaining = bodyString(body: newlineCleanedBody, width: width, start: location, end: end) {
        results.append(remaining)
    }
    
    return results
}