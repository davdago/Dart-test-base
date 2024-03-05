import 'package:common/models/vehicle.dart';
import 'package:json_annotation/json_annotation.dart';

part 'car.g.dart';


@JsonSerializable(explicitToJson: true, includeIfNull: false)
class Car extends Vehicle {
    int doors;

  void openDoor() {
    print("The door is open, I'm looking inside.");
    closeDoor();
  }

  void  closeDoor() {
     print('I am closing the door');
   }

  Future<void> start(int speed) async {
    print("The ${this.brand} ${this.model} is starting");
    
    int initialSpeed = 0;
    Future<void> gas(int i) async{
      print("Test drive");
      while (i <= 50) {
        print("Km/h $i");
        await Future.delayed(Duration(milliseconds:100));
        i++;
    }
  }
    await Future.delayed(Duration(seconds:2));
    await gas(initialSpeed);

    Future<void> stop(int f) async{
      while(f >= 0) {
        print("Km/h $f");
        await Future.delayed(Duration(milliseconds:100));
        f--;
      }
    print("Stop test");
  }
    await Future.delayed(Duration(seconds:2));
    await stop(speed);
  }

    Car({
      required String typeVehicle,
      required String brand,
      required String model,
      required String color,
      required int year,
      required this.doors
    }) : super(
      brand: brand,
      model: model,
      color: color,
      year: year,
      typeVehicle: typeVehicle
      );
    
    
  factory Car.fromJson(Map<String, dynamic> json) => _$CarFromJson(json);
  Map<String, dynamic> toJson() => _$CarToJson(this);
}