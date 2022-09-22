import 'package:equatable/equatable.dart';

abstract class UseCase<Type, Params> {
  Future<Type> call({required Params params});
}

abstract class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
