//
//  PostViewModelTest.swift
//  ios-challengeTest
//
//  Created by Franco Zelener on 20/05/2024.
//

import XCTest
@testable import ios_challenge

final class PostViewModelTest: XCTestCase {
    
    var vm: PostsViewModel = PostsViewModel()
    var emptyPostArray: [Post] = []
    var emptyUserArray: [User] = []
    
    func testPostViewmodelInitialization() {
        
        XCTAssertEqual(vm.posts, emptyPostArray, "Posts array is empty")
        XCTAssertEqual(vm.users, emptyUserArray, "Users array is empty")
    }
    
    func testPostViewModelFetch() async {
        await vm.fetch()
        
        XCTAssertNotEqual(vm.posts, emptyPostArray, "Post array has posts")
        XCTAssertNotEqual(vm.users, emptyUserArray, "Post array has posts")
    }

}
