import 'package:json_annotation/json_annotation.dart';

part 'vehicle.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class Vehicle{
  final String typeVehicle;
  String brand;
  String model;
  String color;
  int year;

  void info(){
    print('''
info vehicle
  type vehicle: ${typeVehicle}
  brand: $brand
  model: $model
  colore: $color
  anno: $year
''');
  }

  Vehicle({
    required this.typeVehicle,
    required this.brand,
    required this.model,
    required this.color,
    required this.year,
  });


  factory Vehicle.fromJson(Map<String, dynamic> json) => _$VehicleFromJson(json);
  Map<String, dynamic> toJson() => _$VehicleToJson(this);
} 



// dart run build_runner build    nella cartella common contenente pubspec.yaml
// dart run build_runner watch    per avviarlo con aggiornamento automatico del file .g.dart