import 'package:aws_dynamodb_api/dynamodb-2012-08-10.dart';
import 'package:aws_lambda_dart_runtime/aws_lambda_dart_runtime.dart';
import 'package:aws_lambda_dart_runtime/runtime/context.dart';
import 'package:common/functions/dynamo/put_car.dart';
import 'dart:convert';
import 'package:common/models/car.dart';

Future<AwsApiGatewayResponse> putCar(
    Context context, AwsApiGatewayEvent event) async {
  try {
    final dynamo = DynamoDB(region: context.region!);
    final body = jsonDecode(event.body!);
    final car = Car.fromJson(body);
    await dynamoPutCar(dynamo, car);
    return AwsApiGatewayResponse.fromJson({'status': 'ok', 'content': car},
        statusCode: 200, headers: {'Access-Control-Allow-Origin': '*'});
  } catch (e) {
    return AwsApiGatewayResponse.fromJson(
        {'status': 'ko', 'content': e.toString()},
        statusCode: 500,
        headers: {'Access-Control-Allow-Origin': '*'});
  }
}
