//: [Previous](@previous)
import Foundation
/*:
 ## Operators
 An operator is a special symbol or phrase you can use to check, change or combine values.
 Some that you are already familiar with would be '+, - /, *', the addition, subtraction, division, and multiplication.
 There are also different types:
 */

/*:
 - Callout(Prefix operator):
 The '-' can be used to turn a number into a negative value and the operator comes before the value.
 */
let myNumberIsNegative = -2

/*:
 - Callout(Infix operator):
 The '+' helps us combine two values together and goes in between the values.
 */
let addingOperator = 1 + 1

/*:
 - Callout(Postfix operator):
 The '!' and '?' used to handle optional values goes after a value.
 */
let optionalValue: Double? = 2.0
let unwrapped: Double = optionalValue!


/*:
 ### Overloading Operators
 Overloading operators allows us to change the behaviour of the operator based on given parameters. For example, when you use the '+' operator on two strings, the end result are the strings combined together. What happens if I want to '+' a string and an Int?
 */

// Here we define our '+' operator function with a String and Int parameter
func + (left: String, right: Int) -> String {
  
  return "\(left)\(String(right))"
}

// This is our result
let combinedValues = "abc" + 123

/*:
 - Experiment:
 Use the '*' operator to multiply a String and an Int. This returns a new String and repeats the given String the number of times delcared by the Int. ie: "abc" * 3 = "abcabcabc"
 */
func *  (left: String, right: Int) -> String {
    
    var result = ""
    for _ in 1...right {
        result.append(left)
    }
    
    return result
}

let str = "aaab" * 4


/*:
 - Experiment:
 You can also overload the operators within an extension so it only affects this type. Add your own overload operators and you can even change the behaviour of existing ones. A `static` keyword is required for the functions and lie within the extension.
 */
/*:
 - Note:
 Changing the behaviour of existing operators is discouraged in real projects as it can cause confusion.
 */
extension Int {
  
  // Comment this function in to try it!
      static func + (left: Int, right: Int) -> Int{
  
          return left - right
      }
}

let my = 3 + 2

/*:
 ### Custom Operators
 We can declare and implement our own custom operators in addition to the standard operators provided by Swift. Let's add new postfix operator called '+++' and we will have it double a number.
 */

// Because the '+++' operator doesn't exist, new operators are declared at a global level using the `operator` keyword and marked with `prefix`, `infix`, `postfix`.
postfix operator +++
postfix func +++ (number: Int) -> Int {
  
  return number * 2
}

// Now we can freely use our new custom operator
var incrementOne = 4
var incrementTwo = incrementOne+++


/*:
 - Experiment:
 Create your own custom operator using the square root symbol here: √
 */

prefix operator √

prefix func √ (num: Double) -> Double {
    
    return num.squareRoot()
    
}

let num = √4

/*:
 ### Swift Operators Guidelines
 - Don't create an operator unless its meaning is obvious
 - Custom operators should only be for convenience. Any complex functionality should be implemented in a function
 - Don't use custom operators with exotic symbols because it might be harder for a user to type out
 */

/*:
 - Callout(Challenge):
 When we have percentage values, we tend to convert them into their decimal form before doing any arithmetic to them. Create an operator with the '%' that will be a convenient operator to convert Int values into a usable percentage value. ie: 10% = 0.1
 */

postfix operator %
postfix func % (num:Int) -> Double {
    
    return Double(num)/100
    
}

let num2 = 90%


/*:
 - Callout(Challenge):
 We can also overload existing operators or change their functionality. Try using the '+' on two arrays of Int together. What is the result? Now let's change the functionality. Take the two arrays and sum together the values at their correspding index.
 
 For example, [1,2] + [3,4] = [4,6]. If the array count size are not the same, then return nil
 */


    
func + (left: [Int], right: [Int]) -> [Int]? {
        
        guard left.count == right.count else { return nil }
        
        var result:[Int] = []
        
        for i in 0..<left.count {
            
            result.append(left[i] + right[i])
        }
        
        return result
    }


let result = [1,2] + [3,4]
print(result)

//: [Next](@next)
