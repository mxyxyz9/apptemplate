
import XCTest
@testable import apptemplate

class HomeViewModelTests: XCTestCase {
    
    var viewModel: HomeViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = HomeViewModel()
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    func testFeaturedItems() {
        XCTAssertEqual(viewModel.featuredItems.count, 3)
    }
    
    func testQuickActions() {
        XCTAssertEqual(viewModel.quickActions.count, 3)
    }
    
    func testContentSections() {
        XCTAssertEqual(viewModel.contentSections.count, 2)
    }
}
