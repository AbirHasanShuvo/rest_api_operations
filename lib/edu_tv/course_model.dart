import 'dart:convert';

class CourseModel {
  int status;
  String message;
  CourseData data;

  CourseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory CourseModel.fromJson(String str) =>
      CourseModel.fromMap(json.decode(str));

  factory CourseModel.fromMap(Map<String, dynamic> json) => CourseModel(
        status: json["status"],
        message: json["message"],
        data: CourseData.fromMap(json["data"]),
      );
}

class CourseData {
  int id;
  int courseCategoryId;
  int courseLevelId;
  int courseLanguageId;
  String courseType;
  String title;
  String slug;
  String shortDescription;
  String totalLecture;
  String totalDuration;
  String thumbnailImage;
  String thumbnailImageBig;
  String introVideo;
  String regularFee;
  String discountAmount;
  String courseFee;
  String averageRating;
  bool isPopular;
  bool isSlider;
  bool isDraft;
  bool isAutoPublished;
  bool isPublished;
  PublishedBy publishedBy;
  String publishedAt;
  int status;
  int createdBy;
  int updatedBy;
  String createdAt;
  String updatedAt;
  dynamic expiredDate;
  bool isVideoOrLink1;
  bool isVideoOrLink;
  bool isCertificate;
  Category category;
  Level level;
  Language language;

  CourseData({
    required this.id,
    required this.courseCategoryId,
    required this.courseLevelId,
    required this.courseLanguageId,
    required this.courseType,
    required this.title,
    required this.slug,
    required this.shortDescription,
    required this.totalLecture,
    required this.totalDuration,
    required this.thumbnailImage,
    required this.thumbnailImageBig,
    required this.introVideo,
    required this.regularFee,
    required this.discountAmount,
    required this.courseFee,
    required this.averageRating,
    required this.isPopular,
    required this.isSlider,
    required this.isDraft,
    required this.isAutoPublished,
    required this.isPublished,
    required this.publishedBy,
    required this.publishedAt,
    required this.status,
    required this.createdBy,
    required this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
    required this.expiredDate,
    required this.isVideoOrLink1,
    required this.isVideoOrLink,
    required this.isCertificate,
    required this.category,
    required this.level,
    required this.language,
  });

  factory CourseData.fromMap(Map<String, dynamic> json) => CourseData(
        id: json["id"],
        courseCategoryId: json["course_category_id"],
        courseLevelId: json["course_level_id"],
        courseLanguageId: json["course_language_id"],
        courseType: json["course_type"],
        title: json["title"],
        slug: json["slug"],
        shortDescription: json["short_description"],
        totalLecture: json["total_lecture"],
        totalDuration: json["total_duration"],
        thumbnailImage: json["thumbnail_image"],
        thumbnailImageBig: json["thumbnail_image_big"],
        introVideo: json["intro_video"],
        regularFee: json["regular_fee"],
        discountAmount: json["discount_amount"],
        courseFee: json["course_fee"],
        averageRating: json["average_rating"],
        isPopular: json["is_popular"] == 1,
        isSlider: json["is_slider"] == 1,
        isDraft: json["is_draft"] == 1,
        isAutoPublished: json["is_auto_published"] == 1,
        isPublished: json["is_published"] == 1,
        publishedBy: PublishedBy.fromMap(json["published_by"]),
        publishedAt: json["published_at"],
        status: json["status"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        expiredDate: json["expired_date"],
        isVideoOrLink1: json["is_video_or_link1"] == 1,
        isVideoOrLink: json["is_video_or_link"] == 1,
        isCertificate: json["is_certificate"] == 1,
        category: Category.fromMap(json["category"]),
        level: Level.fromMap(json["level"]),
        language: Language.fromMap(json["language"]),
      );
}

class PublishedBy {
  int id;
  String firstName;

  PublishedBy({
    required this.id,
    required this.firstName,
  });

  factory PublishedBy.fromMap(Map<String, dynamic> json) => PublishedBy(
        id: json["id"],
        firstName: json["first_name"],
      );
}

class Category {
  int id;
  String name;

  Category({
    required this.id,
    required this.name,
  });

  factory Category.fromMap(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
      );
}

class Level {
  int id;
  String name;

  Level({
    required this.id,
    required this.name,
  });

  factory Level.fromMap(Map<String, dynamic> json) => Level(
        id: json["id"],
        name: json["name"],
      );
}

class Language {
  int id;
  String name;

  Language({
    required this.id,
    required this.name,
  });

  factory Language.fromMap(Map<String, dynamic> json) => Language(
        id: json["id"],
        name: json["name"],
      );
}
