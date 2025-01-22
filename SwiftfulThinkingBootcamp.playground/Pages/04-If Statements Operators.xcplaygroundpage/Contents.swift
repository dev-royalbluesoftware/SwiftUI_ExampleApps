//: [Previous](@previous)

import Foundation

// MARK: - IF STATEMENTS and OPERATORS

var likeCount: Double = 5
var commentCount: Double = 10
var viewCount: Double = 20

// likeCount = 5 + 1
likeCount += 1
print(likeCount)

// subraction
likeCount -= 1
print(likeCount)

// multiplication
likeCount *= 2
print(likeCount)

// division
likeCount /= 2
print(likeCount)

// Order of Operations
// PEMDAS
likeCount = (5 + 1) * 2
print(likeCount)

likeCount = 20 / 5 * 5
print(likeCount)

// if-statements
if likeCount == 5 {
    print("Post has 5 likes")
    
} else {
    print("Post has \(likeCount) likes")
}

if commentCount > 0 {
    print("\(commentCount) is the number of comments")
    
} else {
    print("No comments yet")
}

if commentCount > 0 && viewCount > 100 {
    print("This post is popular")
    
} else {
    print("this post is not popular")
}

if commentCount > 0 || viewCount > 0 {
    print("Post has a few comments")
    
} else {
    print("Post has no comments")
}

//: [Next](@next)
