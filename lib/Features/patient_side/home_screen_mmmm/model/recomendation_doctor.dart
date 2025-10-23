class RecomendationDoctorModel {
  final String imgUrl;
  final String name;
  final String specialist;
  final double rating;
  final int review;

  RecomendationDoctorModel({
    required this.imgUrl,
    required this.name,
    required this.specialist,
    required this.rating,
    required this.review,
  });
}

//    RecommendationDoctor List of data
List<RecomendationDoctorModel> itemsReco = [
  RecomendationDoctorModel(
    imgUrl: "lib/images/doctor2.png",
    name: "DR.Mohamed Eleraky",
    specialist: "General | RSUD Gatot Subroto",
    rating: 4.8,
    review: 2500,
  ),
  RecomendationDoctorModel(
    imgUrl: "lib/images/doctor2.png",
    name: "DR.mazen Eleraky",
    specialist: "General | RSUD Gatot Subroto",
    rating: 4.8,
    review: 2500,
  ),
  RecomendationDoctorModel(
    imgUrl: "lib/images/doctor2.png",
    name: "DR.abdo Eleraky",
    specialist: "Dentistryy | RSUD Gatot Subroto",
    rating: 4.8,
    review: 2500,
  ),

  RecomendationDoctorModel(
    imgUrl: "lib/images/doctor2.png",
    name: "DR.Mohamed Eleraky",
    specialist: "General | RSUD Gatot Subroto",
    rating: 4.8,
    review: 2500,
  ),
  RecomendationDoctorModel(
    imgUrl: "lib/images/doctor2.png",
    name: "DR.mazen Eleraky",
    specialist: "General | RSUD Gatot Subroto",
    rating: 4.8,
    review: 2500,
  ),
  RecomendationDoctorModel(
    imgUrl: "lib/images/doctor2.png",
    name: "DR.abdo Eleraky",
    specialist: "Dentistry | RSUD Gatot Subroto",
    rating: 4.8,
    review: 2500,
  ),
];
