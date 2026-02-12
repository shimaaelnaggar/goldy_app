// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

import 'package:goldy/features/gold/data/models/gold_model.dart';
import 'package:goldy/features/gold/data/repository/gold_rebository.dart';

part 'gold_state.dart';

class GoldCubit extends Cubit<GoldState> {
  final GoldRebository goldRebository;
  GoldCubit(this.goldRebository) : super(GoldInitial());

  Future<void> fetchGold() async {
    emit(GoldLoading());
    final result = await goldRebository.getGold();
    result.fold(
      (error) => emit(GoldError(errorMessage: error)),
      (goldModel) => emit(GoldLoaded(goldModel: goldModel)),
    );
  }
}
