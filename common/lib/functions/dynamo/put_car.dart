import 'package:aws_dynamodb_api/dynamodb-2012-08-10.dart';
import 'package:common/functions/dynamo/marshal.dart';
import 'package:common/models/car.dart';

Future<void> dynamoPutCar(DynamoDB dynamoDB, Car car) async {
      await dynamoDB.putItem(item: marshal(car.toJson()), tableName: 'cars_test');
}