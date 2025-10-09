import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_care_app/core/constants/colors.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String selectedFilter = "All";
  String searchText = "";
  String selectedSpeciality = "All";
  double? selectedRating;

  List<String> recentSearches = [
    "Dental",
    "General Medical Check",
    "Nearest Hospital",
    "Neurologic"
  ];

  final List<Map<String, dynamic>> allDoctors = List.generate(20, (index) {
    final baseDoctors = [
      {
        "name": "Dr. Randy Wigham",
        "speciality": "General",
        "hospital": "RSUD Gatot Subroto",
        "rating": 4.8,
        "reviews": 4279,
        "image": "lib/images/doc1(chat).jpg"
      },
      {
        "name": "Dr. Jack Sulivan",
        "speciality": "Neurologic",
        "hospital": "RSUD Gatot Subroto",
        "rating": 4.5,
        "reviews": 4279,
        "image": "lib/images/doc2(chat).jpg"
      },
      {
        "name": "Dr. Hanna Stanton",
        "speciality": "Pediatric",
        "hospital": "RSUD Gatot Subroto",
        "rating": 4.3,
        "reviews": 4279,
        "image": "lib/images/doc3(chat).jpg"
      },
    ];
    return baseDoctors[index % baseDoctors.length];
  });

  List<Map<String, dynamic>> filteredDoctors = [];

  @override
  void initState() {
    super.initState();
    filteredDoctors = allDoctors;
  }

  void _filterDoctors() {
    setState(() {
      filteredDoctors = allDoctors.where((doctor) {
        final matchesSearch = doctor["name"]
                .toString()
                .toLowerCase()
                .contains(searchText.toLowerCase()) ||
            doctor["speciality"]
                .toString()
                .toLowerCase()
                .contains(searchText.toLowerCase());

        final matchesSpeciality =
            selectedSpeciality == "All" || doctor["speciality"] == selectedSpeciality;

        final matchesRating =
            selectedRating == null || doctor["rating"] >= selectedRating!;

        return matchesSearch && matchesSpeciality && matchesRating;
      }).toList();
    });
  }

  void _openSortBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.whiteColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: AppColors.greyColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Center(
                    child: Text(
                      "Sort By",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Divider(
                      indent: 10,
                      endIndent: 10,
                      height: .4,
                      color: AppColors.greyColor.withOpacity(.2)),
                  const SizedBox(height: 30),
                  const Text(
                    "Speciality",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 20),
                  Wrap(
                    spacing: 10,
                    children: ["All", "General", "Neurologic", "Pediatric"]
                        .map((filter) => ChoiceChip(
                              label: Text(filter),
                              selected: selectedSpeciality == filter,
                              selectedColor: AppColors.blueColor,
                              labelStyle: TextStyle(
                                color: selectedSpeciality == filter
                                    ?AppColors.whiteColor
                                    :AppColors.blackColor,
                              ),
                              onSelected: (val) {
                                setModalState(() {
                                  selectedSpeciality = filter;
                                });
                              },
                            ))
                        .toList(),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    "Rating",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 20),
                  Wrap(
                    spacing: 10,
                    children: [


                      ChoiceChip(
                        showCheckmark: false,


                        avatar: Icon(Icons.star, size: 16, color: AppColors.whiteColor),
                        label: const Text("All"),
                        selected: selectedRating == null,
                        selectedColor: AppColors.blueColor,
                        labelStyle: TextStyle(
                          color: selectedRating == null ?AppColors.whiteColor :AppColors.greyColor,
                        ),
                        onSelected: (val) {
                          setModalState(() {
                            selectedRating = null;
                          });
                        },
                      ),
                      ...[5.0, 4.0, 3.0].map(
                        (rate) => ChoiceChip(
                          
                          showCheckmark: false,

                          avatar:  Icon(Icons.star, size: 16, color:AppColors.whiteColor),
                          label: Text(rate.toInt().toString()),
                          selected: selectedRating == rate,
                          selectedColor: AppColors.blueColor,
                          labelStyle: TextStyle(
                            color: selectedRating == rate ?AppColors.whiteColor : AppColors.blackColor,
                          ),
                          onSelected: (val) {
                            setModalState(() {
                              selectedRating = rate;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 35),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.blueColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        _filterDoctors();
                      },
                      child:  Text(
                        "Done",
                        style: TextStyle(fontSize: 16, color:AppColors.whiteColor),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
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
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        backgroundColor: AppColors.whiteColor,
        title: const Text(
          "Search",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        elevation: 0,
      ),
      body: 
      Padding(
        padding: const EdgeInsets.all(8.0),
        child:
         Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: 
              Row(
                children: [
                  Expanded(
                    child:
                     TextField(
                      onChanged: (value) {
                        searchText = value;
                        _filterDoctors();
                      },
                      onSubmitted: (value) {
                        setState(() {
                          searchText = value;
                          if (value.trim().isNotEmpty &&
                              !recentSearches.contains(value)) {
                            recentSearches.insert(0, value);
                          }
                        });
                        _filterDoctors();
                      },
                      decoration: InputDecoration(
                        hintText: "Search doctor...",
                        prefixIcon: const Icon(CupertinoIcons.search),
                        filled: true,
                        fillColor: AppColors.greyColor.withOpacity(0.1),
                        contentPadding: const EdgeInsets.symmetric(vertical: 0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  InkWell(
                    onTap: _openSortBottomSheet,
                    borderRadius: BorderRadius.circular(100),
                    child:  Icon(Icons.filter_list, color:AppColors.blackColor),
                  ),
                ],
              ),
            ),

            if (searchText.isEmpty) ...[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Text(
                      "Recent Search",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.blackColor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          recentSearches.clear();
                        });
                      },
                      child:  Text(
                        "Clear All History",
                        style: TextStyle(
                          fontSize: 14,
                          color:AppColors.blueColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: recentSearches.length,
                itemBuilder: (context, index) {
                  final item = recentSearches[index];
                  return 
                  ListTile(
                    leading:  Icon(Icons.history, color:AppColors.greyColor),
                    title: Text(item),
                    trailing: IconButton(
                      icon:  Icon(Icons.close, color: AppColors.greyColor),
                      onPressed: () {
                        setState(() {
                          recentSearches.removeAt(index);
                        });
                      },
                    ),
                    onTap: () {
                      setState(() {
                        searchText = item;
                      });
                      _filterDoctors();
                    },
                  );
                },
              ),
            ],

            if (searchText.isNotEmpty) ...[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  "${filteredDoctors.length} founds",
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: ["All", "General", "Neurologic", "Pediatric"]
                        .map(
                          (filter) => Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: 
                            ChoiceChip(
                              showCheckmark: false,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                              label: Text(filter),
                              selected: selectedSpeciality == filter,
                              selectedColor: AppColors.blueColor,
                              labelStyle: TextStyle(
                                color: selectedSpeciality == filter
                                    ? AppColors.whiteColor
                                    :AppColors.blackColor,
                              ),
                              onSelected: (val) {
                                setState(() {
                                  selectedSpeciality = filter;
                                  _filterDoctors();
                                });
                              },
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),

              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  itemCount: filteredDoctors.length,
                  itemBuilder: (context, index) {
                    final doctor = filteredDoctors[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 15),
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color:AppColors.greyColor.withOpacity(.2),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: 
                     Container(
  margin: const EdgeInsets.only(bottom: 15),
  padding: const EdgeInsets.all(15),
  decoration: BoxDecoration(
    color:AppColors.whiteColor,
    borderRadius: BorderRadius.circular(20),

  ),
  child: Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.asset(
          doctor["image"],
          width: 100,
          height: 100,
          fit: BoxFit.contain,
        ),
      ),
      const SizedBox(width: 15),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              doctor["name"],
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              "${doctor["speciality"]} | ${doctor["hospital"]}",
              style: TextStyle(
                color: AppColors.greyColor,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                 Icon(Icons.star, color:AppColors.yellowcolor, size: 16),
                const SizedBox(width: 5),
                Text(
                  "${doctor["rating"]} (${doctor["reviews"]} reviews)",
                  style: TextStyle(
                    color: AppColors.greyColor,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  ),
), );
                  },
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}