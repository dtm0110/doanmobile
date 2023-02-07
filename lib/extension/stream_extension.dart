import 'dart:async';

extension StreamX<T> on StreamController<T> {
  T addEventValid(T value) {
    if (isClosed) return value;
    add(value);
    return value;
  }
}
