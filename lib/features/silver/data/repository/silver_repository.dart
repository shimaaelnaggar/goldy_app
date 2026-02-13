import 'package:dartz/dartz.dart';
import 'package:goldy/core/api/api_constants.dart';
import 'package:goldy/core/api/dio_helper.dart';
import 'package:goldy/features/silver/data/models/silver_model.dart';

class SilverRepository {
  Future<Either<String, SilverModel>> getSilver() async {
    try {
      final res = await DioHelper.getData(
        endpoint: ApiConstants.silverEndpoint,
      );
      return right(SilverModel.fromJson(res.data));
    } catch (e) {
      return left(e.toString());
    }
  }
}
