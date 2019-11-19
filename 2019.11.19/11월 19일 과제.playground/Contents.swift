import UIKit

var str = "Hello, playground"


class Animal {
    var brain: Bool = true
    var legs: Int {
        get { return 0 }
    }
}

class Human: Animal{
    override var legs: Int {
            get { return 2 }
        }
}

class Pet: Animal {
    override var legs: Int {
        get { return 4 }
    }
    var fleas: Int {
        get { return 0 }
    }
}


class Dog: Pet {
    override var fleas: Int {
        get { return 8 }
    }
}

class Cat: Pet {
    override var fleas: Int {
        get { return 4 }
    }
}
