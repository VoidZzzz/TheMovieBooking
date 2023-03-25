import 'package:json_annotation/json_annotation.dart';
import '../../data/data_vos/video_vo.dart';

part 'get_movie_trailers_response.g.dart';

@JsonSerializable()
class GetMovieTrailersResponse{
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "results")
  List<VideoVO>? results;

  GetMovieTrailersResponse(this.id, this.results);

  factory GetMovieTrailersResponse.fromJson(Map<String, dynamic> json) => _$GetMovieTrailersResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetMovieTrailersResponseToJson(this);
}