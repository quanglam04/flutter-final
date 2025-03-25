class ErrorEntity {
  ErrorEntity({required this.message});

  final String message;
}

extension ErrorEntityExtension on ErrorEntity? {
  ErrorEntity? operator &(bool other) {
    return other ? this : null;
  }
}
