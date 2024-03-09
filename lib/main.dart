// ignore_for_file: prefer_function_declarations_over_variables
import 'package:aws_lambda_dart_runtime/aws_lambda_dart_runtime.dart';
import 'package:dart_base/handlers/api/get_car.dart';
import 'package:dart_base/handlers/api/put_car.dart';
import 'package:dart_base/handlers/api/delete_car.dart';
import 'package:dart_base/handlers/api/update_car.dart';

void main() async {
  Runtime()
    ..registerHandler<AwsApiGatewayEvent>("main.getCar", getCar)
    ..registerHandler<AwsApiGatewayEvent>("main.deleteCar", deleteCar)
    ..registerHandler<AwsApiGatewayEvent>("main.putCar", putCar)
    ..registerHandler<AwsApiGatewayEvent>("main.updateCar", updateCar)
    ..invoke();
}
