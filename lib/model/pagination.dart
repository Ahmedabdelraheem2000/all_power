class Pagination {
  int? iItemsOnPage;
  int? iPerPages;
  int? iCurrentPage;
  int? iTotalPages;

  Pagination(
      {this.iItemsOnPage, this.iPerPages, this.iCurrentPage, this.iTotalPages});

  Pagination.fromJson(Map<String, dynamic> json) {
    iItemsOnPage = json['i_items_on_page'];
    iPerPages = json['i_per_pages'];
    iCurrentPage = json['i_current_page'];
    iTotalPages = json['i_total_pages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['i_items_on_page'] = this.iItemsOnPage;
    data['i_per_pages'] = this.iPerPages;
    data['i_current_page'] = this.iCurrentPage;
    data['i_total_pages'] = this.iTotalPages;
    return data;
  }
}