import 'package:quotable/app/modules/quota_list/domain/entities/tags.dart';

class TagsModel extends Tags{
  const TagsModel({
    required List<String> tags,
  }):super(
    tags: tags,
  );

  factory TagsModel.fromJson(List<dynamic> json) =>
      TagsModel(tags: json.map((e) => e.toString()).toList());
}