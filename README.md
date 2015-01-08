#MinimalJSON
Inspired by more comprehensive Swift JSON libraries such as SwiftyJSON https://github.com/SwiftyJSON/SwiftyJSON, but with a view to providing much simpler code that is designed to work only in read-only mode (i.e. only for traversing existing JSON contained in an NSData object that has been loaded in from a file).
##Usage
###Initialisation
````
if let parsedJSON = JSON(data: data) {
    // Handle successfully parsed JSON here
} else {
    // Handle failure here
}
````
###Subscripts
All values are returned as optionals, to allow the use of the nil coalescing operator (??) to provide a default if the hash is not found in the JSON dictionary
####Hashes
See below for the supported types
#####Bool
    var b = parsedJSON["hash"].bool ?? false
#####String
    var b = parsedJSON["hash"].string ?? "Default String"
#####Int
    var b = parsedJSON["hash"].int ?? 0
#####Unsigned Int
    var b = parsedJSON["hash"].unsignedInt ?? 0        
#####Float
    var b = parsedJSON["hash"].float ?? 0.0
#####Double
    var b = parsedJSON["hash"].double ?? 0.0
#####Swift Array
    var b = parsedJSON["hash"].array ?? []
#####Swift Dictionary
    var b = parsedJSON["hash"].array ?? [:]        
####Indexes
Integer indices are supported, with range checking (with will return nil if the index is out of bounds)
    var b = parsedJSON[0]["hash"].bool ?? false
####Chained subscripts
Subscripts can be mixed and chained indefinitely
    var b = parsedJSON["hash1"][1]["hash2"][99]["hash3"].bool ?? false
##Integration
For now, there is no support for Carthage or CocoaPods, so either drag the JSON.swift file into the project or include the whole project for workspaces.
##Requirements
* Xcode 6.1
* iOS 7+
##Performance
No attention has been paid to performance at this stage, but this is likely to be an area
