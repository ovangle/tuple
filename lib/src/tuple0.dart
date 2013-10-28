part of tuple;

class Tuple0 extends Tuple {
  const Tuple0();
  
  List get _items => [];
}

class ZippedIterable0 extends ZippedIterable {
  ZippedIterable0._() : super._([]);
  
  ZippedIterator get iterator => new ZippedIterator0._();
  
  ZippedIterable mapProjection(f(Tuple0 elem)) => new ZippedIterable0._();
}

class ZippedIterator0 extends ZippedIterator {
  ZippedIterator0._() : super._([]);
  
  Tuple0 get current => new Tuple0();
  
  bool moveNext() => false;
}