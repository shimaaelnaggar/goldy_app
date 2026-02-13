
import 'package:goldy/features/silver/data/models/silver_model.dart';

sealed class SilverState {}

final class SilverInitial extends SilverState {}

final class SilverLoading extends SilverState {}

final class SilverLoaded extends SilverState {
  final SilverModel silverModel;
  SilverLoaded({required this.silverModel});
}

final class SilverError extends SilverState {
  final String errorMessage;
  SilverError({required this.errorMessage});
}
