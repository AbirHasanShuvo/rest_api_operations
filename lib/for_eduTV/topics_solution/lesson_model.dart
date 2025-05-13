class Lesson {
  final int id;
  final int courseId;
  final int topicId;
  final String title;
  final String duration;
  final String video;
  final bool isYoutube;

  Lesson({
    required this.id,
    required this.courseId,
    required this.topicId,
    required this.title,
    required this.duration,
    required this.video,
    required this.isYoutube,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      id: json['id'],
      courseId: json['courseId'],
      topicId: json['topicId'],
      title: json['title'],
      duration: json['duration'],
      video: json['video'],
      isYoutube: json['is_youtube_embed_link'] == 1,
    );
  }
}
