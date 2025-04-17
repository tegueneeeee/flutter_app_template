/// Extension methods for Iterable classes (List, Set, etc.)
extension IterableExtensions<T> on Iterable<T> {
  /// Returns the first element that satisfies the given predicate,
  /// or null if no element satisfies the predicate.
  T? firstWhereOrNull(bool Function(T element) test) {
    for (final element in this) {
      if (test(element)) {
        return element;
      }
    }
    return null;
  }

  /// Returns the first element, or null if the iterable is empty.
  T? get firstOrNull => isEmpty ? null : first;

  /// Returns the last element, or null if the iterable is empty.
  T? get lastOrNull => isEmpty ? null : last;

  /// Returns a new lazy [Iterable] with all elements that satisfy the
  /// predicate [test] and not null.
  Iterable<T> whereNotNull(bool Function(T element) test) {
    return where((element) => element != null && test(element));
  }

  /// Returns the element at the given [index] or null if the
  /// index is out of bounds.
  T? elementAtOrNull(int index) {
    if (index < 0 || index >= length) return null;
    return elementAt(index);
  }

  /// Returns a new lazy [Iterable] with all non-null elements.
  Iterable<R> mapNotNull<R>(R? Function(T element) transform) sync* {
    for (final element in this) {
      final transformed = transform(element);
      if (transformed != null) {
        yield transformed;
      }
    }
  }

  /// Groups the elements of this iterable by the value returned by [keySelector].
  Map<K, List<T>> groupBy<K>(K Function(T element) keySelector) {
    final map = <K, List<T>>{};
    for (final element in this) {
      final key = keySelector(element);
      map.putIfAbsent(key, () => []).add(element);
    }
    return map;
  }

  /// Groups the elements of this iterable by the value returned by [keySelector]
  /// and transforms each element using [valueTransform].
  Map<K, List<V>> groupByTransform<K, V>(
    K Function(T element) keySelector,
    V Function(T element) valueTransform,
  ) {
    final map = <K, List<V>>{};
    for (final element in this) {
      final key = keySelector(element);
      map.putIfAbsent(key, () => []).add(valueTransform(element));
    }
    return map;
  }

  /// Associates the elements of this iterable with keys returned by [keySelector].
  /// If multiple elements have the same key, the last one will be used.
  Map<K, T> associateBy<K>(K Function(T element) keySelector) {
    final map = <K, T>{};
    for (final element in this) {
      final key = keySelector(element);
      map[key] = element;
    }
    return map;
  }

  /// Returns a new lazy [Iterable] of all elements yielded from results of
  /// [transform] function being invoked on each element of this iterable.
  Iterable<R> flatMap<R>(Iterable<R> Function(T element) transform) sync* {
    for (final element in this) {
      yield* transform(element);
    }
  }

  /// Returns a list containing the results of applying the given [transform]
  /// function to each element in the original iterable. If null is returned
  /// by the transform function, that element is not included in the result list.
  List<R> mapNotNullToList<R>(R? Function(T element) transform) {
    final result = <R>[];
    for (final element in this) {
      final transformed = transform(element);
      if (transformed != null) {
        result.add(transformed);
      }
    }
    return result;
  }

  /// Returns a new list containing only elements matching the given [predicate].
  List<T> filterToList(bool Function(T element) predicate) {
    final result = <T>[];
    for (final element in this) {
      if (predicate(element)) {
        result.add(element);
      }
    }
    return result;
  }

  /// Returns a new list containing all elements not matching the given [predicate].
  List<T> filterNotToList(bool Function(T element) predicate) {
    return filterToList((element) => !predicate(element));
  }

  /// Returns a new list containing all elements not null.
  List<T> whereNotNullToList() {
    return filterToList((element) => element != null);
  }

  /// Returns the sum of all elements in the iterable according to the [selector].
  /// Returns 0 if the iterable is empty.
  double sumBy(num Function(T element) selector) {
    var sum = 0.0;
    for (final element in this) {
      sum += selector(element);
    }
    return sum;
  }

  /// Returns the average of all elements in the iterable according to the [selector].
  /// Returns 0 if the iterable is empty.
  double averageBy(num Function(T element) selector) {
    if (isEmpty) {
      return 0.0;
    }
    return sumBy(selector) / length;
  }

  /// Returns the maximum element according to the provided [selector] function,
  /// or null if the iterable is empty.
  T? maxBy<R extends Comparable>(R Function(T element) selector) {
    if (isEmpty) {
      return null;
    }

    var maxElement = first;
    var maxValue = selector(maxElement);

    for (final element in skip(1)) {
      final value = selector(element);
      if (value.compareTo(maxValue) > 0) {
        maxElement = element;
        maxValue = value;
      }
    }

    return maxElement;
  }

  /// Returns the minimum element according to the provided [selector] function,
  /// or null if the iterable is empty.
  T? minBy<R extends Comparable>(R Function(T element) selector) {
    if (isEmpty) {
      return null;
    }

    var minElement = first;
    var minValue = selector(minElement);

    for (final element in skip(1)) {
      final value = selector(element);
      if (value.compareTo(minValue) < 0) {
        minElement = element;
        minValue = value;
      }
    }

    return minElement;
  }

  /// Returns a new iterable with distinct elements from the original iterable.
  /// The [keySelector] function is used to determine the unique key for each element.
  Iterable<T> distinctBy<K>(K Function(T element) keySelector) {
    final set = <K>{};
    return where((element) => set.add(keySelector(element)));
  }

  /// Chunks the iterable into lists of the specified [size].
  /// The last chunk may be smaller than the specified size.
  List<List<T>> chunked(int size) {
    if (size <= 0) {
      throw ArgumentError('Size must be greater than 0');
    }

    final result = <List<T>>[];
    final iterator = this.iterator;

    while (iterator.moveNext()) {
      final chunk = <T>[iterator.current];

      var i = 1;
      while (i < size && iterator.moveNext()) {
        chunk.add(iterator.current);
        i++;
      }

      result.add(chunk);
    }

    return result;
  }
}

/// Extension methods for List
extension ListExtensions<T> on List<T> {
  /// Swaps two elements at the specified indices.
  void swap(int index1, int index2) {
    final temp = this[index1];
    this[index1] = this[index2];
    this[index2] = temp;
  }

  /// Moves an element from [fromIndex] to [toIndex].
  void move(int fromIndex, int toIndex) {
    if (fromIndex == toIndex) return;

    final element = removeAt(fromIndex);

    if (toIndex > fromIndex) {
      insert(toIndex - 1, element);
    } else {
      insert(toIndex, element);
    }
  }

  /// Adds all elements from [elements] if they're not already in the list.
  void addAllUnique(Iterable<T> elements) {
    for (final element in elements) {
      if (!contains(element)) {
        add(element);
      }
    }
  }

  /// Replaces an element at [index] with [newElement].
  void replace(int index, T newElement) {
    this[index] = newElement;
  }

  /// Checks if the list is sorted according to the natural ordering of its elements.
  /// The elements must be comparable.
  bool isSorted() {
    if (length <= 1) return true;

    for (var i = 1; i < length; i++) {
      if ((this[i - 1] as Comparable).compareTo(this[i]) > 0) {
        return false;
      }
    }

    return true;
  }

  /// Gets a random element from the list.
  T get random {
    if (isEmpty)
      throw StateError('Cannot get a random element from an empty list');

    return this[(DateTime.now().microsecondsSinceEpoch % length).abs()];
  }
}
