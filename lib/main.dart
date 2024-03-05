import 'package:common/models/example.dart';
import 'package:common/models/car.dart';

void main(List<String> args) {
  
  //testing the common class Person

  final person = Person(firstName: 'John', lastName: 'Connor', age: 21);

  print('hello ${person.firstName}');
  print(person.toJson());

  final test = {"firstName": "Marie", "lastName": "Curie", "age": 30};

  final Person newPerson = Person.fromJson(test);
  print(newPerson.toJson());


  final firstCar = Car(typeVehicle: "Car", brand: "Fiat", model: "500", color: "black", year: 2015, doors: 3);
  firstCar.openDoor();
  firstCar.info();
  firstCar.closeDoor();

  int speed = 50;
  firstCar.start(speed); 

  print(firstCar.toJson());


  List<dynamic> elenco = ["Federico",23,"Marta",12,"Serena","Camilla","Claudio",3,"Luca",52,7];

  elenco.forEach((e) => print(e));
  
  List<String> newElencoName = [];
  List<int> newElencoInt = [];

  elenco.forEach((e) {
    if(e.runtimeType  == String){
      newElencoName.add(e);
    } else {
      newElencoInt.add(e);
    }
  });
  
  print(newElencoInt);
  print(newElencoInt[1] + 3);
  print(newElencoName.toString().toUpperCase());
  print(newElencoName[2]);


  Map<String, dynamic> Animal = {
    "name": "Micio",
    "species":"Cat",
    "color": "Gray",
    "age": 5
  };
  print(Animal["species"]);
  print('Hello, my name is ${Animal["name"]} and I am ${Animal["age"]} years old.');

  Animal.forEach((key, value) {
    print("$key : $value");
  });
}
