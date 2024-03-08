import 'package:aws_dynamodb_api/dynamodb-2012-08-10.dart';
import 'package:common/functions/dynamo/unmarshal.dart';
import 'package:common/models/car.dart';

Future<Car> dynamoGetCar(DynamoDB dynamoDB, String carID) async {
  final res = await dynamoDB.getItem(key: {'carID': AttributeValue(s: carID)}, tableName: 'cars_test');
  return Car.fromJson(unmarshal(res.item!));
}