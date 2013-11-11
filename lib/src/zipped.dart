part of tuple;

abstract class _ZippedIterable extends Iterable<Tuple> with IterableMixin<Tuple> {
  final List<Iterable> _iterables;
  
  _ZippedIterable(List<Iterable> iterables) 
      : _iterables = new List.from(iterables, growable: false);
  
  _ZippedIterator get iterator;
}

abstract class _ZippedIterator implements Iterator {
  final List<Iterator> _iterators;
  
  _ZippedIterator(Iterable<Iterator> _iterators)
      : _iterators = new List.from(_iterators, growable: false);
  
  bool moveNext() {
    for (var iterator in _iterators) {
      if (!iterator.moveNext()) return false;
    }
    return true;
  }
}

abstract class _MappedZippedIterable extends Object with IterableMixin<Tuple> {
  _ZippedIterable _zipped;
  Function _f;
  List<int> _ords;
  
  _MappedZippedIterable(_ZippedIterable this._zipped, dynamic f(Tuple t), List<int> this._ords) :
    _f = f;
}