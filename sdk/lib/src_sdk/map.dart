
_copyValues<K, V>(
    Map<K, V> from, Map<K, V> to, bool recursive, bool acceptNull) {
  for (var key in from.keys) {
    if (from[key] is Map<K, V> && recursive) {
      if (!(to[key] is Map<K, V>)) {
        to[key] = <K, V>{} as V;
      }
      _copyValues(from[key] as Map, to[key] as Map, recursive, acceptNull);
    } else {
      if (from[key] != null || acceptNull) to[key] = from[key];
    }
  }
}

Map<K, V> mergeMap<K, V>(Iterable<Map<K, V>> maps,
    {bool recursive: true, bool acceptNull: false}) {
  Map<K, V> result = <K, V>{};
  maps.forEach((Map<K, V> map) {
    if (map != null) _copyValues(map, result, recursive, acceptNull);
  });
  return result;
}