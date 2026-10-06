import 'package:mal/models/models.dart';

class MangaModel {
  final int? malId;
  final String? url;
  final Map<String, ImageModel>? images;
  final String? title;
  final List<String>? titleSynonyms;
  final String? type;
  final int? chapters;
  final int? volumes;
  final String? status;
  final double? score;
  final String? synopsis;
  final String? background;

  // Field Baru yang Lebih Dalam
  final PublishModel? publishedProp;
  final List<CommonResource>? authors;
  final List<CommonResource>? genres;
  final List<CommonResource>? themes;
  final List<CommonResource>? demographics;
  final List<MangaRelation>? relations;
  final List<ExternalLink>? externalLinks;

  MangaModel({
    this.malId, this.url, this.images, this.title, this.titleSynonyms,
    this.type, this.chapters, this.volumes, this.status, this.score,
    this.synopsis, this.background, this.publishedProp, this.authors,
    this.genres, this.themes, this.demographics, this.relations, this.externalLinks,
  });

  factory MangaModel.fromJson(Map<String, dynamic> json) {
    return MangaModel(
      malId: json['mal_id'],
      url: json['url'],
      title: json['title'],
      titleSynonyms: (json['title_synonyms'] as List?)?.cast<String>(),
      type: json['type'],
      chapters: json['chapters'],
      volumes: json['volumes'],
      status: json['status'],
      score: (json['score'] as num?)?.toDouble(),
      synopsis: json['synopsis'],
      background: json['background'],

      // Parsing Images Map
      images: (json['images'] as Map?)?.map(
            (k, v) => MapEntry(k.toString(), ImageModel.fromJson(v)),
      ),

      // Parsing Nested Objects
      publishedProp: json['published'] != null ? PublishModel.fromJson(json['published']['prop']) : null,

      // Parsing Lists
      authors: (json['authors'] as List?)?.map((e) => CommonResource.fromJson(e)).toList(),
      genres: (json['genres'] as List?)?.map((e) => CommonResource.fromJson(e)).toList(),
      themes: (json['themes'] as List?)?.map((e) => CommonResource.fromJson(e)).toList(),
      demographics: (json['demographics'] as List?)?.map((e) => CommonResource.fromJson(e)).toList(),
      relations: (json['relations'] as List?)?.map((e) => MangaRelation.fromJson(e)).toList(),
      externalLinks: (json['external'] as List?)?.map((e) => ExternalLink.fromJson(e)).toList(),
    );
  }
}