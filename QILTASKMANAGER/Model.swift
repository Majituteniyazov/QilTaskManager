import Foundation


var ToDoItemsArray: [ [String : Any] ] {
    set {
        UserDefaults.standard.set(newValue, forKey: "ToDoDataKey")
        UserDefaults.standard.synchronize()
    }
    get {
        if let array = UserDefaults.standard.array(forKey: "ToDoDataKey") as? [[String:Any]] {
            return array
        } else {
            return []
        }
    }
}


func addItem(itemName: String, isCompleted: Bool = false) {
    ToDoItemsArray.append(["Name" : itemName, "isCompleted" : isCompleted])
}


func removeItem(at index: Int) {
    ToDoItemsArray.remove(at: index)
}


func moveItem(fromIndex: Int, toIndex: Int) {
    let from = ToDoItemsArray[fromIndex]
    ToDoItemsArray.remove(at: fromIndex)
    ToDoItemsArray.insert(from, at: toIndex)
}


func changeState(atItem: Int) -> Bool {
    ToDoItemsArray[atItem]["isCompleted"] = !(ToDoItemsArray[atItem]["isCompleted"] as! Bool)
    
    return ToDoItemsArray[atItem]["isCompleted"] as! Bool
}
