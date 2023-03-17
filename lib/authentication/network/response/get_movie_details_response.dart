import 'package:json_annotation/json_annotation.dart';
import '../../data/data_vos/movie_vo.dart';

part 'get_movie_details_response.g.dart';

@JsonSerializable()
class GetMovieDetailsResponse{

  @JsonKey(name: "code")
  int? code;

  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "data")
  MovieVO? data;

  GetMovieDetailsResponse(this.code, this.message, this.data);

  factory GetMovieDetailsResponse.fromJson(Map<String, dynamic> json) => _$GetMovieDetailsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetMovieDetailsResponseToJson(this);
}