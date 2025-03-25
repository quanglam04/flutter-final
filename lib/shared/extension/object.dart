extension ScopeFunctionsForObjectNullable<T extends Object> on T? {
  bool isNull() {
    return this == null;
  }

  K as<K>() {
    return this as K;
  }
}

extension ScopeFunctionsForObject<T extends Object> on T {
  ReturnType let<ReturnType>(ReturnType operationFor(T self)) {
    return operationFor(this);
  }
}

extension ScopeFunctionsForListObjectNullable<T extends Object>
    on Iterable<T>? {
  bool get isNullOrEmpty => (this ?? []).isEmpty;

  bool get isNotNullOrEmpty => (this ?? []).isNotEmpty;
}

extension AsExtension on Object? {
  X as<X>() => this as X;

  X? asOrNull<X>() {
    final self = this;
    return self is X ? self : null;
  }
}
