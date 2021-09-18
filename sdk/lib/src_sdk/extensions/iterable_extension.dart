extension IterableExtension<E> on Iterable<E> {
  bool get isNullOrEmpty => this == null || this.isEmpty;

  bool get isNotNullOrEmpty => !isNullOrEmpty;

  E firstOrDefault([bool func(E element)]) {
    if (func == null) {
      Iterator<E> it = iterator;
      if (!it.moveNext()) {
        return null;
      }
      return it.current;
    }
    for (E element in this) {
      if (func(element)) return element;
    }
    return null;
  }

  E lastOrDefault([bool func(E element)]) {
    if (func == null) {
      if (this.isNotNullOrEmpty) return this.last;
      return null;
    }
    E result;
    bool foundMatching = false;
    for (E element in this) {
      if (func(element)) {
        result = element;
        foundMatching = true;
      }
    }
    if (foundMatching) return result;
    return null;
  }

  dynamic foldLeft(dynamic val, func) {
    this.forEach((entry) => val = func(val, entry));
    return val;
  }
}
