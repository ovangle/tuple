part of tuple;

class Tuple1<T1> extends Tuple {
  final T1 $1;
  
  List get _items => [$1];
  
  const Tuple1(T1 this.$1);
  
  /**
   * Project the tuple onto the specified ordinates
   */
  Tuple project([int ord1]) {
    var ords = [];
    if (ord1 != null) ords.add(ord1);
    return _project(ords);
  }
  
  Tuple1<dynamic> update1(dynamic f(T1 i)) => new Tuple1(f($1));
}

class ZippedIterable1<T1> extends _ZippedIterable {
  ZippedIterable1._(List<Iterable> iterables) : super(iterables);
  Iterator get iterator => new ZippedIterator1._(_iterables[0]);
  
  ZippedIterable1<dynamic> mapProjection(dynamic f(Tuple1<T1> tuples)) => new ZippedIterable1._(map(f));
}

class ZippedIterator1<T1> extends _ZippedIterator {
  ZippedIterator1._(Iterable<T1> iter1) : super([iter1]);
  Tuple1<T1> get current => new Tuple1<T1>(_iterators[0].current);
}