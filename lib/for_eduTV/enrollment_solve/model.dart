// models/enrollment_model.dart
class EnrollmentResponse {
  final int status;
  final String message;
  final EnrollmentData? data;
  final dynamic errors;

  EnrollmentResponse({
    required this.status,
    required this.message,
    this.data,
    this.errors,
  });

  factory EnrollmentResponse.fromJson(Map<String, dynamic> json) {
    return EnrollmentResponse(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null ? EnrollmentData.fromJson(json['data']) : null,
      errors: json['errors'],
    );
  }
}

class EnrollmentData {
  final int currentPage;
  final List<Enrollment> enrollments;
  final String firstPageUrl;
  final int from;
  final int lastPage;
  final String lastPageUrl;
  final List<Link> links;
  final String? nextPageUrl;
  final String path;
  final int perPage;
  final String? prevPageUrl;
  final int to;
  final int total;

  EnrollmentData({
    required this.currentPage,
    required this.enrollments,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.links,
    this.nextPageUrl,
    required this.path,
    required this.perPage,
    this.prevPageUrl,
    required this.to,
    required this.total,
  });

  factory EnrollmentData.fromJson(Map<String, dynamic> json) {
    return EnrollmentData(
      currentPage: json['current_page'],
      enrollments: (json['data'] as List)
          .map((e) => Enrollment.fromJson(e))
          .toList(),
      firstPageUrl: json['first_page_url'],
      from: json['from'],
      lastPage: json['last_page'],
      lastPageUrl: json['last_page_url'],
      links: (json['links'] as List).map((e) => Link.fromJson(e)).toList(),
      nextPageUrl: json['next_page_url'],
      path: json['path'],
      perPage: json['per_page'],
      prevPageUrl: json['prev_page_url'],
      to: json['to'],
      total: json['total'],
    );
  }
}

class Enrollment {
  final int id;
  final int studentId;
  final int? paymentMethodId;
  final dynamic couponId;
  final String invoiceNo;
  final String date;
  final String? expiredDate;
  final String totalQuantity;
  final String subtotal;
  final String totalVatAmount;
  final String itemTotalDiscountAmount;
  final String couponDiscountAmount;
  final String gtotal;
  final String grandTotal;
  final String paymentTnxNo;
  final String paymentStatus;
  final dynamic paymentMethod;
  final int status;
  final String source;
  final dynamic approvedBy;
  final dynamic approvedAt;
  final dynamic cancelledBy;
  final dynamic cancelledAt;
  final String createdAt;
  final String updatedAt;
  final dynamic deletedAt;
  final Student student;
  final List<EnrollmentItem> enrollmentItems;
  final dynamic course;

  Enrollment({
    required this.id,
    required this.studentId,
    this.paymentMethodId,
    this.couponId,
    required this.invoiceNo,
    required this.date,
    this.expiredDate,
    required this.totalQuantity,
    required this.subtotal,
    required this.totalVatAmount,
    required this.itemTotalDiscountAmount,
    required this.couponDiscountAmount,
    required this.gtotal,
    required this.grandTotal,
    required this.paymentTnxNo,
    required this.paymentStatus,
    this.paymentMethod,
    required this.status,
    required this.source,
    this.approvedBy,
    this.approvedAt,
    this.cancelledBy,
    this.cancelledAt,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.student,
    required this.enrollmentItems,
    this.course,
  });

  factory Enrollment.fromJson(Map<String, dynamic> json) {
    return Enrollment(
      id: json['id'],
      studentId: json['student_id'],
      paymentMethodId: json['payment_method_id'],
      couponId: json['coupon_id'],
      invoiceNo: json['invoice_no'],
      date: json['date'],
      expiredDate: json['expired_date'],
      totalQuantity: json['total_quantity'],
      subtotal: json['subtotal'],
      totalVatAmount: json['total_vat_amount'],
      itemTotalDiscountAmount: json['item_total_discount_amount'],
      couponDiscountAmount: json['coupon_discount_amount'],
      gtotal: json['gtotal'],
      grandTotal: json['grand_total'],
      paymentTnxNo: json['payment_tnx_no'],
      paymentStatus: json['payment_status'],
      paymentMethod: json['payment_method'],
      status: json['status'],
      source: json['source'],
      approvedBy: json['approved_by'],
      approvedAt: json['approved_at'],
      cancelledBy: json['cancelled_by'],
      cancelledAt: json['cancelled_at'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
      student: Student.fromJson(json['student']),
      enrollmentItems: (json['enrollment_items'] as List)
          .map((e) => EnrollmentItem.fromJson(e))
          .toList(),
      course: json['course'],
    );
  }
}

class Student {
  final int id;
  final String firstName;
  final String lastName;
  final String username;
  final String image;

  Student({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.image,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      username: json['username'],
      image: json['image'],
    );
  }
}

class EnrollmentItem {
  final int id;
  final dynamic studentId;
  final int enrollmentId;
  final int courseId;
  final String regularFee;
  final String discountAmount;
  final String courseFee;
  final String quantity;
  final String totalFee;
  final String createdAt;
  final String updatedAt;
  final dynamic deletedAt;
  final Course? course;

  EnrollmentItem({
    required this.id,
    this.studentId,
    required this.enrollmentId,
    required this.courseId,
    required this.regularFee,
    required this.discountAmount,
    required this.courseFee,
    required this.quantity,
    required this.totalFee,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    this.course,
  });

  factory EnrollmentItem.fromJson(Map<String, dynamic> json) {
    return EnrollmentItem(
      id: json['id'],
      studentId: json['student_id'],
      enrollmentId: json['enrollment_id'],
      courseId: json['course_id'],
      regularFee: json['regular_fee'],
      discountAmount: json['discount_amount'],
      courseFee: json['course_fee'],
      quantity: json['quantity'],
      totalFee: json['total_fee'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
      course: json['course'] != null ? Course.fromJson(json['course']) : null,
    );
  }
}

class Course {
  final int id;
  final int courseCategoryId;
  final int courseLevelId;
  final int courseLanguageId;
  final String courseType;
  final String title;
  final String slug;
  final String shortDescription;
  final String totalLecture;
  final String totalDuration;
  final String thumbnailImage;
  final String thumbnailImageBig;
  final String introVideo;
  final String regularFee;
  final String discountAmount;
  final String courseFee;
  final String averageRating;
  final int isPopular;
  final int isSlider;
  final int isDraft;
  final int isAutoPublished;
  final int isPublished;
  final int publishedBy;
  final String publishedAt;
  final int status;
  final int createdBy;
  final int updatedBy;
  final String createdAt;
  final String updatedAt;
  final dynamic expiredDate;
  final int isVideoOrLink1;
  final int isVideoOrLink;
  final int isCertificate;
  final dynamic deletedAt;

  Course({
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
    this.expiredDate,
    required this.isVideoOrLink1,
    required this.isVideoOrLink,
    required this.isCertificate,
    this.deletedAt,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'],
      courseCategoryId: json['course_category_id'],
      courseLevelId: json['course_level_id'],
      courseLanguageId: json['course_language_id'],
      courseType: json['course_type'],
      title: json['title'],
      slug: json['slug'],
      shortDescription: json['short_description'],
      totalLecture: json['total_lecture'],
      totalDuration: json['total_duration'],
      thumbnailImage: json['thumbnail_image'],
      thumbnailImageBig: json['thumbnail_image_big'],
      introVideo: json['intro_video'],
      regularFee: json['regular_fee'],
      discountAmount: json['discount_amount'],
      courseFee: json['course_fee'],
      averageRating: json['average_rating'],
      isPopular: json['is_popular'],
      isSlider: json['is_slider'],
      isDraft: json['is_draft'],
      isAutoPublished: json['is_auto_published'],
      isPublished: json['is_published'],
      publishedBy: json['published_by'],
      publishedAt: json['published_at'],
      status: json['status'],
      createdBy: json['created_by'],
      updatedBy: json['updated_by'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      expiredDate: json['expired_date'],
      isVideoOrLink1: json['is_video_or_link1'],
      isVideoOrLink: json['is_video_or_link'],
      isCertificate: json['is_certificate'],
      deletedAt: json['deleted_at'],
    );
  }
}

class Link {
  final String? url;
  final String label;
  final bool active;

  Link({
    this.url,
    required this.label,
    required this.active,
  });

  factory Link.fromJson(Map<String, dynamic> json) {
    return Link(
      url: json['url'],
      label: json['label'],
      active: json['active'],
    );
  }
}