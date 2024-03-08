import 'package:aws_dynamodb_api/dynamodb-2012-08-10.dart';
import 'package:aws_lambda_dart_runtime/aws_lambda_dart_runtime.dart';
import 'package:aws_lambda_dart_runtime/runtime/context.dart';
import 'package:common/functions/dynamo/delete_car.dart';

Future<AwsApiGatewayResponse> deleteCar(
    Context context, AwsApiGatewayEvent event) async {
  try {
    final dynamo = DynamoDB(region: context.region!);

    final carID = event.queryStringParameters!['carID'];
     await dynamoDeleteCar(dynamo, carID);

    return AwsApiGatewayResponse.fromJson({'status': 'ok', 'content': "Car deleted"},
        statusCode: 200, headers: {'Access-Control-Allow-Origin': '*'});
  } catch (e) {
    return AwsApiGatewayResponse.fromJson(
        {'status': 'ko', 'content': e.toString()},
        statusCode: 500,
        headers: {'Access-Control-Allow-Origin': '*'});
  }
}