//
//  _0240328_DanielSpady_Assement_CountryUITestsLaunchTests.swift
//  20240328-DanielSpady-Assement-CountryUITests
//
//  Created by Daniel Spady on 2024-03-28.
//

import XCTest

final class _0240328_DanielSpady_Assement_CountryUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
