extension IntToExceptionExtension on int {
  Duration seconds() {
    return Duration(seconds: this);
  }
}
