import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  const HomeState();
  @override
  List<Object> get props => [];
}

class HomeStateInitial extends HomeState {}

class HomeStateLoading extends HomeState {}

class HomeStateSucces extends HomeState {}

class HomeStateError extends HomeState {
  const HomeStateError({required this.error});
  final String error;

  @override
  List<Object> get props => [error];
}
