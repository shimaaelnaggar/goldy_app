// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:goldy/features/silver/data/repository/silver_repository.dart';
import 'package:goldy/features/silver/presentation/cubit/silver_state.dart';

class SilverCubit extends Cubit<SilverState> {
  final SilverRepository silverRepository;
  SilverCubit(this.silverRepository) : super(SilverInitial());

  Future<void> fetchSilver() async {
    emit(SilverLoading());
    final result = await silverRepository.getSilver();
    result.fold(
      (error) => emit(SilverError(errorMessage: error)),
      (silverModel) => emit(SilverLoaded(silverModel: silverModel)),
    );
  }
}
