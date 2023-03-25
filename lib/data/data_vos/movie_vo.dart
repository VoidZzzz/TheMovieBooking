import 'package:json_annotation/json_annotation.dart';
import 'cast_vo.dart';

part 'movie_vo.g.dart';

@JsonSerializable()
class MovieVO{
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "original_title")
  String? originalTitle;

  @JsonKey(name: "release_date")
  String? releaseDate;

  @JsonKey(name: "genres")
  List<String>? genres;

  @JsonKey(name: "poster_path")
  String? posterPath;

  @JsonKey(name: "overview")
  String? overview;

  @JsonKey(name: "rating")
  double? rating;

  @JsonKey(name: "runtime")
  int? runtime;

  @JsonKey(name: "casts")
  List<CastVO>? casts;

  MovieVO(this.id, this.originalTitle, this.releaseDate, this.genres,
      this.posterPath);

  factory MovieVO.fromJson(Map<String, dynamic> json) => _$MovieVOFromJson(json);

  Map<String, dynamic> toJson() => _$MovieVOToJson(this);
}