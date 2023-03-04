class PaginatedModel<T> {
  final List<T> items;
  final int? total;
  final int? page;

  const PaginatedModel({
    this.items = const [],
    this.total,
    this.page,
  });
}
