class WorkExperience{
  final String companyName;
  final String position;
  final DateTime startDate;
  final DateTime? endDate;
  final String description;

  WorkExperience({
    required this.companyName,
    required this.position,
    required this.startDate,
    this.endDate,
    required this.description,
  });
}