import XCTest
@testable import chapter05

final class ConstraintHierarchyTests: XCTestCase {
    @MainActor func testNearestCommonAncestorIncludesSelfAndRejectsDifferentTrees() {
        let root = UIView()
        let parent = UIView()
        let first = UIView()
        let second = UIView()
        root.addSubview(parent)
        parent.addSubview(first)
        parent.addSubview(second)
        XCTAssertTrue(first.nearestCommonAncestor(with: second) === parent)
        XCTAssertTrue(parent.nearestCommonAncestor(with: first) === parent)
        XCTAssertTrue(first.nearestCommonAncestor(with: first) === first)
        XCTAssertNil(first.nearestCommonAncestor(with: UIView()))
    }

    @MainActor func testActivationSupportsLayoutGuidesAndRejectsUnattachedItems() {
        let root = UIView()
        let child = UIView()
        root.addSubview(child)
        let constraint = child.leadingAnchor.constraint(equalTo: root.layoutMarginsGuide.leadingAnchor)
        XCTAssertTrue(constraint.activateInCommonAncestor())
        XCTAssertTrue(constraint.isActive)
        constraint.isActive = false
        let invalid = child.leadingAnchor.constraint(equalTo: UIView().leadingAnchor)
        XCTAssertFalse(invalid.activateInCommonAncestor())
        XCTAssertFalse(invalid.isActive)
        let unownedGuide = UILayoutGuide()
        XCTAssertFalse(child.leadingAnchor.constraint(equalTo: unownedGuide.leadingAnchor).activateInCommonAncestor())
    }

    @MainActor func testSearchIncludesConstraintsInstalledAboveNearestAncestor() {
        let root = UIView()
        let parent = UIView()
        let first = UIView()
        let second = UIView()
        root.addSubview(parent)
        parent.addSubview(first)
        parent.addSubview(second)
        let constraint = first.widthAnchor.constraint(equalTo: second.widthAnchor)
        root.addConstraint(constraint)
        XCTAssertTrue(NSLayoutConstraint.constraints(between: second, and: first).contains { $0 === constraint })
        XCTAssertTrue(NSLayoutConstraint.constraints(between: first, and: UIView()).isEmpty)
    }
}
