mixin BaseUseCase<T, P> {
  Future<T> call(P params);
}
