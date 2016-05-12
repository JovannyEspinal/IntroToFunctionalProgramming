import Foundation

enum RideType {
    case Family
    case Kids
    case Thrill
    case Scary
    case Relaxing
    case Water
}

struct Ride {
    let name: String
    let types: Set<RideType>
    let waitTime: Double
}

let parkRides = [
    Ride(name: "Raging Rapids", types: [.Family, .Thrill, .Water], waitTime: 45.0),
    Ride(name: "Crazy Funhouse", types: [.Family], waitTime: 10.0),
    Ride(name: "Spinning Tea Cups", types: [.Kids], waitTime: 15.0),
    Ride(name: "Spooky Hollow", types: [.Scary], waitTime: 30.0),
    Ride(name: "Thundeer Coaster", types: [.Family, .Thrill], waitTime: 60.0),
    Ride(name: "Grand Carousel", types: [.Family, .Kids], waitTime: 15.0),
    Ride(name: "Bumper Boats", types: [.Family, .Water], waitTime: 25.0),
    Ride(name: "Mountaint Railroad", types: [.Family, .Relaxing], waitTime: 0.0)
]

// MARK: Imperative Programming Example
// Return an array of strings of the sorted ride names alphabetically
//func sortedNames(rides: [Ride]) -> [String] {
//    var sortedRides = rides
//    var key: Ride
//    
//    // Loop over all the rides passed into the function
//    for i in 0..<sortedRides.count {
//        key = sortedRides[i]
//        
//        //Perform insertion sort
//        var j = i
//        
//        while j >= 0 {
//            if key.name.localizedCompare(sortedRides[j].name) == .OrderedAscending {
//                sortedRides.removeAtIndex(j + 1)
//                sortedRides.insert(key, atIndex: j)
//            }
//            j -= 1
//        }
//    }
//    
//    // Gather the names of the sorted rides
//    var sortedNames = [String]()
//    
//    for ride in sortedRides {
//        sortedNames.append(ride.name)
//    }
//    
//    return sortedNames
//}
//
//print(sortedNames(parkRides))
//
//var originalNames = [String]()
//for ride in parkRides {
//    originalNames.append(ride.name)
//}
//
//print(originalNames)


// MARK: Declarative Programming Examples

// Filter Function
func waitTimeIsShort(ride: Ride) -> Bool {
    return ride.waitTime < 15.0
}

var shortWaitTimeRides = parkRides.filter(waitTimeIsShort)
print(shortWaitTimeRides)

// Filter Function using trailing closure solution
shortWaitTimeRides = parkRides.filter { $0.waitTime < 15.0 }
print(shortWaitTimeRides)

// Map Function - Apply map to elements of parkRides to get a list of all the ride names as strings
let rideNames = parkRides.map { $0.name }
print(rideNames)
print(rideNames.sort(<))

// Reduce Function - Calculate the average wait time for the rides
let averageWaitTime = parkRides.reduce(0.0) { (average, ride) in average + (ride.waitTime/Double(parkRides.count)) }
print(averageWaitTime)




// MARK: Currying
func rideTypeFilter(type: RideType)(fromRides rides: [Ride]) -> [Ride] {
    return rides.filter { $0.types.contains(type) }
}

func createRideTypeFilter(type: RideType) -> [Ride] -> [Ride] {
    return rideTypeFilter(type)
}

let kidRideFilter = createRideTypeFilter(.Kids)
print(kidRideFilter(parkRides))

