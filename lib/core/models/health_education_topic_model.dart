class HealthEducationTopicModel {
  final String title;
  final String description;
  final String coverImageUrl;
  final List<HealthSectionModel> sections;

  HealthEducationTopicModel({
    required this.title,
    required this.description,
    required this.coverImageUrl,
    required this.sections,
  });
}

class HealthSectionModel {
  final String title;
  final String description;
  final List<String> bulletPoints;
  final List<HealthSectionModel>? subSections;

  HealthSectionModel({
    required this.title,
    required this.description,
    required this.bulletPoints,
    this.subSections,
  });
}
