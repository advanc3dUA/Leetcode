import UIKit

//We are given an array asteroids of integers representing asteroids in a row. The indices of the asteriod in the array represent their relative position in space.
//
//For each asteroid, the absolute value represents its size, and the sign represents its direction (positive meaning right, negative meaning left). Each asteroid moves at the same speed.
//
//Find out the state of the asteroids after all collisions. If two asteroids meet, the smaller one will explode. If both are the same size, both will explode. Two asteroids moving in the same direction will never meet.
//
//
//
//Example 1:
//
//Input: asteroids = [5,10,-5]
//Output: [5,10]
//Explanation: The 10 and -5 collide resulting in 10. The 5 and 10 never collide.
//Example 2:
//
//Input: asteroids = [8,-8]
//Output: []
//Explanation: The 8 and -8 collide exploding each other.
//Example 3:
//
//Input: asteroids = [10,2,-5]
//Output: [10]
//Explanation: The 2 and -5 collide resulting in -5. The 10 and -5 collide resulting in 10.
//
//
//Constraints:
//
//2 <= asteroids.length <= 104
//-1000 <= asteroids[i] <= 1000
//asteroids[i] != 0

class Solution {
    func asteroidCollision(_ asteroids: [Int]) -> [Int] {
        var stack = [Int]()
        for asteroid in asteroids {
            var destroyed = false
            while let last = stack.last, last > 0, asteroid < 0 {
                if abs(last) < abs(asteroid) {
                    stack.removeLast()
                } else if abs(last) == abs(asteroid) {
                    stack.removeLast()
                    destroyed = true
                    break
                } else {
                    destroyed = true
                    break
                }
            }
            if !destroyed {
                stack.append(asteroid)
            }
        }
        return stack
    }
}

let solution = Solution()
//print("\(solution.asteroidCollision([5,10,-5]))")
//print("\(solution.asteroidCollision([8, -8]))")
//print("\(solution.asteroidCollision([10,2,-5]))")
//print(solution.asteroidCollision([-2,-1,1,2]))
print(solution.asteroidCollision([-2,-2,-2,1]))
