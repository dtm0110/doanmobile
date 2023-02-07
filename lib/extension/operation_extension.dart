import '../global/logger.dart';

extension ObjectExt<T> on T {
  R let<R>(R Function(T it) op) => op(this);
}

dynamic tryBlock(Function() block) {
  try {
    return block.call();
  } catch (e) {
    Log.d('Error: $e');
    return null;
  }
}
