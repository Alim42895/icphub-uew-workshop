import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import Float "mo:base/Float";
import Array "mo:base/Array";
import Time "mo:base/Time";

actor Project{
//   var greeting = "Hello World!";
//   let number : Nat = 5; //Nat stands for Natural numbers
//   Debug.print(greeting);
//   Debug.print(debug_show(number));

//   type StudentDetails = {
//     id: Nat;
//     name : Text;
//     course : Text;
//   };

//   var student1 : StudentDetails = {
//     id = 123456;
//     name ="Chemist";
//     course = "CS2";
//   };

//   Debug.print(Nat.toText(student1.id) #student1.name #student1.course);
//   // Type.toType(value)

//   // Functions
//   // Public functions and private functions
// //   public func addTwoNumbers(): async Nat{
// //     var x :Nat = 5;
// //     var y : Nat = 9;
// //     return (x+y)
// //     // Debug.print(debug_show(x+y));
// //   }

// func addnum(x:Nat, y:Nat):  Nat{
  
//   return (x+y);
// };

// public func addTwoNumbers(x:Nat, y:Nat):async Nat{
//   addnum(x,y);
// };


// Decentralized Banking System
// checkBalance, withdraw,topup ,transactions

stable var balance : Float = 100;
stable var transactions : [Transaction] = [];
stable var transactionId : Nat = 0;

type Transaction ={
  id: Nat;
  message: Text;
  timeStamp: Time.Time;
};
func recordTransactions(message:Text){
  var transaction : Transaction = {
    id = transactionId;
    message = message;
    timeStamp = Time.now(); 
  };
    transactions := Array.append(transactions, [transaction]);
    transactionId +=1;

};

public func checkBalance(): async Text {
  var message = "Your balance is "  # Float.toText(balance);
  recordTransactions(message);
  return message;
};

public func topUp(amount: Float): async Text{
  balance := balance + amount;
  var message = "You deposited: " # Float.toText(amount);
  recordTransactions(message);
  return message;
};

public func withdrawalBalance(amount: Float) : async Text{
  if (amount > balance){
    return "Insufficient balance";
  }

  else {
    balance := balance - amount;
  var message = "You withdrew: " #Float.toText(amount);
  recordTransactions(message);
  return message;
  }
};

// var b : [Text] = [];

public func getTransactions(): async [Transaction]{
  return transactions;
}


}

// stable saves your state
