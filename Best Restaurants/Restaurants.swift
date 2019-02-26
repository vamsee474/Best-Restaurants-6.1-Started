//
//  BestFriends.swift
//  ExpendableBestFriends
//
//  Created by Michael Rogers on 8/17/18.
//  Copyright © 2018 Michael Rogers. All rights reserved.
//


// Our original take on Restaurant just used a single table view, and a single array
// of Strings. Now that we are building a navigation-based app, we need more info
// to display in the details -- hence BestFriends.

// Notice that our model is using the singleton design pattern (because friends is private, we can't initialize
// friends outside of the struct

import Foundation

struct Restaurant : CustomStringConvertible, Equatable {
    var name:String
    var genre:Genre
    var rating:Int {
        willSet {
            if newValue < 0 || newValue > maxNumStars {
                print("DEBUG: Rating is supposed to always be between 0-\(maxNumStars), inclusive")
            }
        }
    }
    
    let maxNumStars:Int = 5
    
    // Equatable protocol method lets us to compare 2 restaurants using the == operator
    static func == (lhs: Restaurant, rhs: Restaurant) -> Bool {
        return lhs.name == rhs.name && lhs.genre == rhs.genre && lhs.rating == rhs.rating
    }
    
    // When we try and print a Restaurant instance, it will show whatever is returned by description
    var description: String {
        return "\(name) -- \(genre)"
    }
}

struct Restaurants {
    
    static var shared = Restaurants()
    
    private var restaurants:[Restaurant] = [
        Restaurant(name: "Planet Sub",  genre: .sandwiches, rating: 5),
        Restaurant(name: "Subway", genre: .sandwiches, rating: 3),
        Restaurant(name: "Applebee's", genre: .popular, rating: 4),
        Restaurant(name: "Pizza Ranch",  genre: .pizza, rating: 4),
        Restaurant(name: "A&G's", genre: .greek, rating: 3),
        Restaurant(name: "Jimmy Johns", genre: .sandwiches, rating: 3),
        ]
    
    private init(){}
    
    func numRestaurants()->Int {
        return restaurants.count
    }
    
    func restaurant(_ index:Int) -> Restaurant {
        return restaurants[index]
    }
    
    // this lets us use [ ] notation instead of the above
    
    subscript(index:Int) -> Restaurant {
        return restaurants[index]
    }
    
    mutating func add(restaurant:Restaurant){
        restaurants.append(restaurant)
    }
    
    mutating func delete(restaurant:Restaurant){
        for i in 0 ..< restaurants.count {
            if restaurants[i] == restaurant {
                restaurants.remove(at:i)
                break
            }
        }
        
    }
}
    
    enum Genre {case chinese, greek, italian, mexican, pizza, popular, sandwiches, vegetarian }
