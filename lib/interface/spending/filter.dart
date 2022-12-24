enum OrderType { asc, desc }

class SpendingFilter {
  String title;
  String description;
  double? value;
  String note;
  String type;
  String fromDate;
  String toDate;
  int currentPage;
  int pageSize;
  OrderType order;

  SpendingFilter({
    this.title = '',
    this.description = '',
    this.value,
    this.note = '',
    this.fromDate = '',
    this.toDate = '',
    this.type = '',
    this.currentPage = 0,
    this.pageSize = 10,
    this.order = OrderType.asc,
  });
}
