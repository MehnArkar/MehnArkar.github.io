import 'package:freezed_annotation/freezed_annotation.dart';

part 'project.freezed.dart';

@freezed
class Project with _$Project{
  factory Project({
    required String name,
    required String description,
    @Default([])  List<String> images,
    String? playstore,
    String? appstore,


  }) = _Project;

}