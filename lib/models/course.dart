class Course {
  final String courseCode;
  final String courseTitle;
  final String courseLevel;
  final int noOfLectures;
  final int noOfSections;
  final int noOfHours;
  final String department;
  final String status;

  Course({
    required this.courseCode,
    required this.courseTitle,
    required this.courseLevel,
    required this.noOfLectures,
    required this.noOfSections,
    required this.noOfHours,
    required this.department,
    required this.status,
  });
}
