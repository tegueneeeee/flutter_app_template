import 'package:shared_dependencies/dependencies.dart';

abstract class UseCase<Type, Params, Repository> {
  UseCase({required this.repository});
  final Repository repository;

  Future<Type> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}

class IDParams extends Equatable {
  const IDParams({required this.id});

  final String id;

  @override
  List<Object?> get props => [id];
}

class PaginationParams extends Equatable {
  const PaginationParams({required this.page});

  final int page;

  @override
  List<Object?> get props => [page];
}
