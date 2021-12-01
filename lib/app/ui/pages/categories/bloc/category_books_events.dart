abstract class CategoryBookEvent {
  const CategoryBookEvent();
}

class LoadCategoryBookEvent extends CategoryBookEvent {
  final String code;
  const LoadCategoryBookEvent(this.code);
}
