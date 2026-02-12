import 'package:dartz/dartz.dart';
import 'package:goldy/core/api/api_constants.dart';
import 'package:goldy/core/api/dio_helper.dart';
import 'package:goldy/features/gold/data/models/gold_model.dart';

class GoldRebository {
  Future<Either<String, GoldModel>> getGold() async {
    try {
      final res = await DioHelper.getData(endpoint: ApiConstants.goldEndpoint);
      return right(GoldModel.fromJson(res.data));
    } catch (e) {
      return left(e.toString());
    }
  }
}
