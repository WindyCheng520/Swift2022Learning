import UIKit



enum NameInputError: Error{
    case empty
    case isNumber
}

func getUserFullname(firstName: String, lastName:String)throws ->String{
    if firstName == "" || lastName == ""{
        throw NameInputError.empty
    }else if Int(firstName) != nil || Int(lastName) != nil {
        throw NameInputError.isNumber
    }
    
    let fullname = firstName + " " + lastName
    
    return fullname
}


do{
    try getUserFullname(firstName: "008", lastName: "Wei")
    
}catch NameInputError.empty{
    print("empty name")
}catch NameInputError.isNumber{
    print("input some number")
}catch {
    print("something is wrong")
}

