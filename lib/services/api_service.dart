abstract class ApiService<T> {
  String baseUrl;

  ApiService(this.baseUrl);

  Future<List<T>> fetch();
  Future<T> create(T item);
  Future<T> update(T item);
  Future<void> delete(int id);
}
