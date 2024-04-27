import 'dart:collection';

//
// // class SetsMap<E,V> implements Map<Set<E>,V> {
// class SetsMap<E,V> extends MapBase<Set<E>,V> {
// // class SetsMap<E,V> {
//
//   final List<MapEntry<Set<E>,V>> _map = [];
//
//   @override
//   Iterable<Set<E>> get keys => _map.map((e) => e.key);
//   @override
//   Iterable<V> get values => _map.map((e) => e.value);
//
//
//   @override
//   V? operator [](Object? key) {
//     if (key is E) {
//       for(var entry in _map) {
//         if(entry.key.contains(key)) return entry.value;
//       }
//     }
//     if (key is List<E>) {
//       for(var entry in _map) {
//
//         if(key.toSet().intersection(entry.key).isNotEmpty) return entry.value;
//       }
//     }
//     if (key is Set<E>) {
//       for(var entry in _map) {
//         if(key.intersection(entry.key).isNotEmpty) return entry.value;
//       }
//     }
//     return null;
//   }
//
//   @override
//   void operator []=(Set<E> key, V value) {
//     // _map[key]
//
//   }
//
//   @override
//   void clear() {
//     // TODO: implement clear
//   }
//
//
//   // TODO: implement keys
//   // Iterable<Set<E>> get keys => throw UnimplementedError();
//
//   @override
//   V? remove(Object? key) {
//     if (key.runtimeType != E) return null;
//
//
//     // TODO: implement remove
//     throw UnimplementedError();
//   }
// }
class SetsMapEntry<E, V> {
  SetsMapEntry(this.keys, this.value);

  factory SetsMapEntry.byKV(E key, V value) => SetsMapEntry({key}, value);

  factory SetsMapEntry.withIterableK(Iterable<E> keys, V value) =>
      SetsMapEntry(keys.toSet(), value);

  Set<E> keys;
  V value;
}

class SetsMap<E, V> {
  final List<SetsMapEntry<E, V>> entries = [];

  Iterable<Set<E>> get keys => entries.map((e) => e.keys);

  Iterable<V> get values => entries.map((e) => e.value);

  int get length => entries.length;

  bool get isEmpty => entries.isEmpty;

  bool get isNotEmpty => entries.isNotEmpty;

  V? operator [](Object? key) {
    if (key is E) {
      for (var entry in entries) {
        if (entry.keys.contains(key)) return entry.value;
      }
    }
    if (key is List<E>) {
      for (var entry in entries) {
        if (key.toSet().intersection(entry.keys).isNotEmpty) return entry.value;
      }
    }
    if (key is Set<E>) {
      for (var entry in entries) {
        if (key.intersection(entry.keys).isNotEmpty) return entry.value;
      }
    }
    return null;
  }

  void operator []=(E key, V value) {
    for (int i = 0; i < entries.length; i++) {
      if (entries[i].keys.contains(key)) entries[i].value = value;
    }
  }

  void clear() => entries.clear();

  V? remove(Object? key) {
    if (key is E) {
      for (int i = entries.length - 1; i >= 0; i--) {
        if (entries[i].keys.contains(key)) {
          var val = entries[i].value;
          entries.remove(i);
          return val;
        }
      }
    }
    Set<E>? keys =
        (key is List<E>) ? key.toSet() : (key is Set<E> ? key : null);
    if (keys != null) {
      for (int i = entries.length - 1; i >= 0; i--) {
        if (keys.intersection(entries[i].keys).isNotEmpty) {
          var val = entries[i].value;
          entries.remove(i);
          return val;
        }
      }
    }
    return null;
  }

  bool add(Object? key, V value) {
    if (key is E) {
      for (var entry in entries) {
        if (entry.keys.contains(key)) {
          return false;
        }
      }
      entries.add(SetsMapEntry.byKV(key, value));
      return true;
    }
    if (key is Iterable<E>) {
      for (var entry in entries) {
        if (key.toSet().intersection(entry.keys).isNotEmpty) return false;
      }
      entries.add(SetsMapEntry.withIterableK(key, value));
      return true;
    }
    if (key is Set<E>) {
      for (var entry in entries) {
        if (key.intersection(entry.keys).isNotEmpty) return false;
      }
      entries.add(SetsMapEntry(key, value));
      return true;
    }
    return false;
  }

  void addAll(Iterable<SetsMapEntry<E, V>> other) {
    entries.addAll(other);
  }

  bool containsKey(Object? key) => this[key] != null;

  bool containsValue(V value) {
    for (var entry in entries) {
      if (entry.value == value) return true;
    }
    return false;
  }
}
