abstract class Provider<T> {
  void fetchAll();
  void add(T item);
  void update(T item);
  void delete(String id);
}
