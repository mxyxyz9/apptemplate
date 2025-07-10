
import XCTest

class TabBarUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launch()
    }
    
    func testTabBarNavigation() {
        // Verify that the Home tab is selected by default
        XCTAssertTrue(app.navigationBars["Home"].exists)
        
        // Navigate to the Search tab
        app.tabBars.buttons["Search"].tap()
        XCTAssertTrue(app.navigationBars["Search"].exists)
        
        // Navigate to the Settings tab
        app.tabBars.buttons["Settings"].tap()
        XCTAssertTrue(app.navigationBars["Settings"].exists)
    }
}
