import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';
import '../../../../models/review_model.dart';
import '../../../../services/firestore_services.dart';
import '../widgets/review_card.dart';

class DoctorDetailsReviewScreen extends StatefulWidget {
  final String doctorId;

  const DoctorDetailsReviewScreen({super.key, required this.doctorId});

  @override
  State<DoctorDetailsReviewScreen> createState() =>
      _DoctorDetailsReviewScreenState();
}

class _DoctorDetailsReviewScreenState
    extends State<DoctorDetailsReviewScreen> {
  final FirestoreService _firestoreService = FirestoreService();

  void _showReviewBottomSheet() {
    double selectedRating = 0;
    TextEditingController reviewController = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
                left: 20,
                right: 20,
                top: 20,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Give Rate",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (index) {
                      return IconButton(
                        icon: Icon(
                          Icons.star,
                          color: index < selectedRating
                              ? Colors.amber
                              : Colors.grey.shade300,
                          size: 32,
                        ),
                        onPressed: () {
                          setModalState(() {
                            selectedRating = index + 1;
                          });
                        },
                      );
                    }),
                  ),
                  TextField(
                    controller: reviewController,
                    maxLines: 3,
                    decoration: InputDecoration(
                      hintText: "Write your review here...",
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      if (selectedRating == 0 || reviewController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Please add a rating and a comment"),
                          ),
                        );
                        return;
                      }

                      final newReview = ReviewModel(
                        reviewId: '',
                        patientId:
                        'dummyPatientId', // ممكن تغيريها للمستخدم الحالي
                        doctorId: widget.doctorId,
                        rating: selectedRating,
                        comment: reviewController.text,
                      );

                      await _firestoreService.addReview(newReview);
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.blueColor,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Submit",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: StreamBuilder<List<ReviewModel>>(
        stream: _firestoreService.getDoctorReviews(widget.doctorId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final reviews = snapshot.data ?? [];
          if (reviews.isEmpty) {
            return const Center(
              child: Text(
                "No reviews yet.",
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            itemCount: reviews.length,
            itemBuilder: (context, index) {
              final review = reviews[index];
              return ReviewCard(
                reviewerName: review.patientId,
                reviewerImageUrl: 'lib/images/doctor_avatar.png',
                rating: review.rating ?? 0,
                reviewText: review.comment ?? '',
                timeAgo: review.createdAt.toLocal().toString().split(' ')[0],
              );
            },
          );
        },
      ),

      // 👇 زرار ثابت في الأسفل
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          onPressed: _showReviewBottomSheet,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.blueColor,
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Text(
            "Make a Review",
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
