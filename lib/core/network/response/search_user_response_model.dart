import 'package:base_flutter_bloc/core/network/response/user_response_model.dart';

class SearchUserResponseModel {
  int? totalCount;
  bool? incompleteResults;
  List<UserResponseModel>? items;

  SearchUserResponseModel(
      {required this.totalCount,
      required this.incompleteResults,
      required this.items});

  SearchUserResponseModel.fromJson(Map<String, dynamic> json) {
    totalCount = json['total_count'];
    incompleteResults = json['incomplete_results'];
    if (json['items'] != null) {
      items = <UserResponseModel>[];
      json['items'].forEach((v) {
        items?.add(new UserResponseModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_count'] = totalCount;
    data['incomplete_results'] = incompleteResults;
    if (items != null) {
      data['items'] = items?.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() =>
      'SearchUserResponseModel{totalCount: $totalCount, incompleteResults: $incompleteResults, items: $items}';
}
