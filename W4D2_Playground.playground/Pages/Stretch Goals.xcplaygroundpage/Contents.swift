//: [Previous](@previous)
import Foundation
/*:
 - Callout(Stretch Goal):
Earlier we learned about switch statements and tuples. So far we've evaluated the tuple based on a very simple comparison; we just compare if the values match. We can create more complicated matching patterns for our cases.
*/
var pet = (name: "Tim", animal: "Dog", age: 2)
pet = (name: "Tim", animal: "Dog", age: 2)
switch pet {
case (let name, let animal, let age) where (age < 1 || name.count < 1 || animal.count < 1):
    print("This pet data is not valid")
case ("Billy", "Dog", let age):
    print("You have a sweet dog named Billy at the age of \(age)")
case ("Tim", "Dog", let age) where age == 2:
    print("You have a sweet dog named Tim at the age of \(age)")
case (let name, let animal, ..<3):
    print("You have a young \(animal) named \(name)")
case (let name, let animal, 7...):
    print("You have a older \(animal) named \(name)")
case (let name, let animal, let age):
    print("Name: \(name) | Animal: \(animal) | Age: \(age)")
}

//: Play around with the above switch statement to find out how each case works.
//: Then below, write out what the meaning of the switch condition is.



// case (let name, let animal, let age) where (age < 1 || name.count < 1 || animal.count < 1):
// Explain what this does.
// if age less than 1 and no name and no animal prints out its invalid

// case ("Billy", "Dog", let age):
// Explain what this does.
// get the age value and use it

// case ("Tim", "Dog", let age) where age == 2:
// Explain what this does.
// checking if age matches case age == 2

// case (let name, let animal, ..<3):
// Explain what this does.
// using name and animal while animal is younger than 3

// case (let name, let animal, 7...):
// Explain what this does.
// using name and animal values when pet is over 7 years old

// case (let name, let animal, let age):
// Explain what this does.
// simplily prints out the pet info with the values


/*:
 - Callout(Stretch Goal):
Swift 4 introduces a new feature called generic type constraints. You can use this to only add additional functionality to a generic type that matches a certain set of constraints. Let's take a look at the following example
*/
/*:
 Here we are creating a new extension for an Array. Then we have 'where Element : Numeric". This indicates whatever the generic type is delcared for this array, we add a constraint that the generic type also conforms to the 'Numeric' protocol. Assuming that this constraint is satisfied, the function declared inside the extension will be available.
 */
extension Array where Element: Numeric {
    
    func functionOnlyForNumbers(){
        
        print("This function only appears for number types")
    }
}

let numberArray = [Int]()
numberArray.functionOnlyForNumbers()

let stringArray = [String]()
//stringArray.functionOnlyForNumbers() // MISSING!

//: Now it's your turn. Create an extension on the 'Queue' data structure you created earlier.
//: For elements that conforms to the 'Numeric' protocol, create a function that adds all numbers together in the queue and print out its total.
struct Queue<Element> {
    
    var queue: [Element] = []
    
    mutating func enqueue(ele: Element) {
        self.queue.append(ele)
    }
    
    mutating func dequeue(ele: Element) -> Element? {
        
        guard let _ : Element = queue.first else {
            return nil
        }
        return queue.removeFirst()
    }
}

extension Queue where Element: Numeric {
    
    func sum() {
        var total = 0
        
        if let arrayOfNumbers = self.queue as? [Int] {
            
            for num in arrayOfNumbers {
                total = total + num
            }
        }
        
        print(total)
        
    }
}

var myqueue = Queue.init(queue: [1,2,3])

myqueue.sum()


/*:
 - Callout(Stretch Goal):
 Optional chaining is a process we can use to call properties, methods and subscripts on optionals whose value may or may not be nil. This acts like an alternative way to do force unwrapping but if the optional value is nil, it won't crash the app during runtime.
 */
/*:
 Take a look at this example. We have a Person class and a Residence class. The `residence` property can be nil and this is something we should be aware of when checking `numberOfRooms`.
 */
class Person {
    var residence: Residence?
}

class Residence {
    var numberOfRooms = 1
}

let bob = Person()

// Here we are checking the `residence` property with the '?' in front. If `residence` is nil, it will continue into the else block. Experiment with the '!' so see what happens.
if let roomCount = bob.residence?.numberOfRooms {
    print("Bob's residence has \(roomCount) rooms.")
}
else{
    print("No residence exists")
}

// Using this dictionary, try to use optional chaining to print out the number of characters of each sentence.
let dictionary: Dictionary? = ["Sentence 1" : "Let me help you with your baggage",
                               "Sentence 2" : "I'd rather have a burger",
                               "Sentence 3" : "I think I will buy the red car"]

let count1 = dictionary?["Sentence 1"]?.count
let count2 = dictionary?["Sentence 2"]?.count
let count3 = dictionary?["Sentence 3"]?.count
//: [Next](@next)
