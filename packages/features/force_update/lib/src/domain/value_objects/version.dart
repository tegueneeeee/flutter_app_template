extension type Version._(String value) implements String {
  factory Version(String value) {
    if (!_versionRegex.hasMatch(value)) {
      throw ArgumentError(
        'Version must follow the three-part format (e.g., 0.1.2): $value',
      );
    }
    return Version._(value);
  }

  static final empty = Version._('');
  static final _versionRegex = RegExp(r'^(\d+)\.(\d+)\.(\d+)$');

  List<int> get versionParts =>
      value.split('.').map(int.parse).toList(growable: false);

  
  bool operator >(Version other) {
    final selfVersionParts = versionParts;
    final otherVersionParts = other.versionParts;
    for (var i = 0; i < 3; ++i) {
      if (selfVersionParts[i] > otherVersionParts[i]) {
        return true;
      } else if (selfVersionParts[i] < otherVersionParts[i]) {
        return false;
      }
    }
    return false;
  }

  bool operator <(Version other) => other > this;

  bool operator >=(Version other) => this > other || this == other;

  bool operator <=(Version other) => this < other || this == other;

}
