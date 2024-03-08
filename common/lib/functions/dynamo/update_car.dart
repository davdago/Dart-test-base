import 'package:aws_dynamodb_api/dynamodb-2012-08-10.dart';


Future<void> dynamoUpdateCar(DynamoDB dynamoDB, String carID, String color) async {
  await dynamoDB.updateItem(
      key: {'carID': AttributeValue(s: carID)},
      tableName: 'cars_test',
      updateExpression: 'SET #c = :newColor',
      expressionAttributeNames: {':#c': 'color'},
      expressionAttributeValues: {
        '#newColor': AttributeValue(s: color.toString()),
      });
}
