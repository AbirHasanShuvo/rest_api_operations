class EduTvModel {
  EduTvModel({
    required this.id,
    required this.categoryId,
    required this.levelId,
    required this.languageId,
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
    required this.isSlider,
    required this.isPremier,
    required this.publishedBy,
    required this.publishedAt,
    required this.category,
    required this.level,
    required this.language,
  });

  final int? id;
  final int? categoryId;
  final int? levelId;
  final int? languageId;
  final String? courseType;
  final String? title;
  final String? slug;
  final String? shortDescription;
  final String? totalLecture;
  final String? totalDuration;
  final String? thumbnailImage;
  final String? thumbnailImageBig;
  final String? introVideo;
  final String? regularFee;
  final String? discountAmount;
  final String? courseFee;
  final String? averageRating;
  final int? isSlider;
  final dynamic isPremier;
  final String? publishedBy;
  final DateTime? publishedAt;
  final Category? category;
  final Language? level;
  final Language? language;

  factory EduTvModel.fromJson(Map<String, dynamic> json) {
    return EduTvModel(
      id: json["id"],
      categoryId: json["categoryId"],
      levelId: json["levelId"],
      languageId: json["languageId"],
      courseType: json["courseType"],
      title: json["title"],
      slug: json["slug"],
      shortDescription: json["shortDescription"],
      totalLecture: json["totalLecture"],
      totalDuration: json["totalDuration"],
      thumbnailImage: json["thumbnailImage"],
      thumbnailImageBig: json["thumbnailImageBig"],
      introVideo: json["introVideo"],
      regularFee: json["regularFee"],
      discountAmount: json["discountAmount"],
      courseFee: json["courseFee"],
      averageRating: json["averageRating"],
      isSlider: json["isSlider"],
      isPremier: json["isPremier"],
      publishedBy: json["publishedBy"],
      publishedAt: DateTime.tryParse(json["publishedAt"] ?? ""),
      category:
          json["category"] == null ? null : Category.fromJson(json["category"]),
      level: json["level"] == null ? null : Language.fromJson(json["level"]),
      language:
          json["language"] == null ? null : Language.fromJson(json["language"]),
    );
  }
}

class Category {
  Category({
    required this.id,
    required this.parentId,
    required this.name,
    required this.slug,
    required this.shortDescription,
  });

  final int? id;
  final int? parentId;
  final String? name;
  final String? slug;
  final String? shortDescription;

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json["id"],
      parentId: json["parentId"],
      name: json["name"],
      slug: json["slug"],
      shortDescription: json["shortDescription"],
    );
  }
}

class Language {
  Language({
    required this.id,
    required this.name,
  });

  final int? id;
  final String? name;

  factory Language.fromJson(Map<String, dynamic> json) {
    return Language(
      id: json["id"],
      name: json["name"],
    );
  }
}

class Links {
  Links({
    required this.first,
    required this.last,
    required this.prev,
    required this.next,
  });

  final String? first;
  final String? last;
  final dynamic prev;
  final dynamic next;

  factory Links.fromJson(Map<String, dynamic> json) {
    return Links(
      first: json["first"],
      last: json["last"],
      prev: json["prev"],
      next: json["next"],
    );
  }
}

class Meta {
  Meta({
    required this.currentPage,
    required this.from,
    required this.lastPage,
    required this.links,
    required this.path,
    required this.perPage,
    required this.to,
    required this.total,
  });

  final int? currentPage;
  final int? from;
  final int? lastPage;
  final List<Link> links;
  final String? path;
  final int? perPage;
  final int? to;
  final int? total;

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      currentPage: json["current_page"],
      from: json["from"],
      lastPage: json["last_page"],
      links: json["links"] == null
          ? []
          : List<Link>.from(json["links"]!.map((x) => Link.fromJson(x))),
      path: json["path"],
      perPage: json["per_page"],
      to: json["to"],
      total: json["total"],
    );
  }
}

class Link {
  Link({
    required this.url,
    required this.label,
    required this.active,
  });

  final String? url;
  final String? label;
  final bool? active;

  factory Link.fromJson(Map<String, dynamic> json) {
    return Link(
      url: json["url"],
      label: json["label"],
      active: json["active"],
    );
  }
}
