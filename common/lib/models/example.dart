import 'package:json_annotation/json_annotation.dart';

part 'example.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class Person {
  String firstName;
  String lastName;
  final int? age;

  Person({required this.firstName, required this.lastName, this.age});

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$PersonToJson(this);
}