
import XCTest
@testable import apptemplate

class SearchViewModelTests: XCTestCase {
    
    var viewModel: SearchViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = SearchViewModel()
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    func testSearch() {
        let expectation = XCTestExpectation(description: "Search for results")
        
        viewModel.performSearch(query: "test")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            XCTAssertFalse(self.viewModel.searchResults.isEmpty)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 2.0)
    }
}
