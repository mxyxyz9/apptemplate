
import XCTest
@testable import apptemplate

class SettingsViewModelTests: XCTestCase {
    
    var viewModel: SettingsViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = SettingsViewModel()
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    func testProfile() {
        XCTAssertEqual(viewModel.profile.name, "John Doe")
        XCTAssertEqual(viewModel.profile.email, "john.doe@example.com")
    }
    
    func testAppSettings() {
        XCTAssertTrue(viewModel.appSettings.notificationsEnabled)
        XCTAssertEqual(viewModel.appSettings.theme, .system)
    }
    
    func testAppInfo() {
        XCTAssertEqual(viewModel.appInfo.version, "1.0.0")
    }
}
