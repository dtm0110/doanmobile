extension BoolExtension on bool? {
  bool get isTrue => this == true;

  bool get isFalse => this == false;

  bool get isNullOrFalse => this == null || this == false;
}
