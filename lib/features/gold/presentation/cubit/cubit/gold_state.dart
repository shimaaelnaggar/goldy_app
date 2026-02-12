part of 'gold_cubit.dart';

@immutable
sealed class GoldState {}

final class GoldInitial extends GoldState {}

final class GoldLoading extends GoldState {}

final class GoldLoaded extends GoldState {
  final GoldModel goldModel;
  GoldLoaded({required this.goldModel});
}

final class GoldError extends GoldState {
  final String errorMessage;
  GoldError({required this.errorMessage});
}
