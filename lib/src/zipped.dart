part of tuple;

abstract class ZippedIterable extends Iterable<Tuple> with IterableMixin<Tuple> {
  final List<Iterable> _iterables;
  
  ZippedIterable._(List<Iterable> iterables) 
      : _iterables = new List.from(iterables, growable: false);
  
  factory ZippedIterable.fromZip(Iterable<Tuple> iterables) {
    if (iterables is Iterable<Tuple0>) return new ZippedIterable0._();
    if (iterables is Iterable<Tuple1>) return new ZippedIterable1._(iterables);
    if (iterables is Iterable<Tuple2>) 
        return new ZippedIterable2._(iterables.map((i) => i.item1), 
                                     iterables.map((i) => i.item2));
    if (iterables is Iterable<Tuple3>) 
        return new ZippedIterable3._(iterables.map((i) => i.item1),
                                     iterables.map((i) => i.item2),
                                     iterables.map((i) => i.item3));
    return new ZippedIterable1._(iterables);
  }
  
  ZippedIterator get iterator;
  
  ZippedIterable mapProjection(Tuple f(Tuple t));
}

abstract class ZippedIterator implements Iterator {
  final List<Iterator> _iterators;
  
  ZippedIterator._(Iterable<Iterator> _iterators)
      : _iterators = new List.from(_iterators, growable: false);
  
  bool moveNext() {
    for (var iterator in _iterators) {
      if (!iterator.moveNext()) return false;
    }
    return true;
  }
}