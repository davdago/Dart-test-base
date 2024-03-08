import 'package:aws_dynamodb_api/dynamodb-2012-08-10.dart';

Future<void> dynamoDeleteCar(DynamoDB dynamoDB, String carID) async {
   await dynamoDB.deleteItem(
      key: {'carID': AttributeValue(s: carID)}, 
      tableName: 'cars_test');
}
