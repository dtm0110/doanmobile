import 'package:job_search/extension/operation_extension.dart';

extension ListExtension<T> on List<T>? {
  T? get firstOrNull =>
      (this != null && this?.isNotEmpty == true) ? this?.first : null;

  T? getOrNull(int index) {
    return this?.let((it) {
      if (index < 0 || index >= it.length) return null;
      return it.elementAt(index);
    });
  }
}
