class SortCondition {
  SortCondition({required this.fieldName, required this.sortType});

  final String fieldName;
  final SortType sortType;

  @override
  String toString() {
    return '$fieldName ${sortType.toString()}';
  }
}

enum SortType {
  descending,
  ascending;

  @override
  String toString() {
    return switch (this) {
      SortType.descending => 'DESC',
      SortType.ascending => 'ASC'
    };
  }
}
