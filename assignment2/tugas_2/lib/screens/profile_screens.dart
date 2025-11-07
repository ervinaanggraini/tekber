import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugas_2/constants/app_colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int currentIndex = 0;

  final List<Map<String, dynamic>> students = [
    {
      'name': 'Jessica Maple',
      'nrp': '5026211001',
      'major': 'Teknik Informatika',
      'semester': '7',
      'image': 'https://images.unsplash.com/photo-1544005313-94ddf0286df2?auto=format&fit=crop&w=800&q=60',
      'skills': 'Flutter, React, UI/UX',
    },
    {
      'name': 'Sarah Chen',
      'nrp': '5026211002',
      'major': 'Teknik Informatika',
      'semester': '7',
      'image': 'https://images.unsplash.com/photo-1494790108755-2616b612b789?auto=format&fit=crop&w=800&q=60',
      'skills': 'Python, Machine Learning',
    },
    {
      'name': 'Emily Rodriguez',
      'nrp': '5026211003',
      'major': 'Teknik Informatika',
      'semester': '7',
      'image': 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?auto=format&fit=crop&w=800&q=60',
      'skills': 'Java, Spring Boot, DevOps',
    },
    {
      'name': 'Ahmad Fadhil',
      'nrp': '5026211004',
      'major': 'Teknik Informatika',
      'semester': '7',
      'image': 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&w=800&q=60',
      'skills': 'Node.js, Database, API',
    },
  ];

  void _nextProfile() {
    setState(() {
      currentIndex = (currentIndex + 1) % students.length;
    });
  }

  void _showAdaptiveSnackBar(BuildContext ctx, String message, {Color? backgroundColor}) {
    final bg = backgroundColor ?? AppColors.primary;
    final textColor = bg.computeLuminance() > 0.5 ? Colors.black : Colors.white;
    ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: GoogleFonts.poppins(color: textColor),
        ),
        backgroundColor: bg,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        toolbarHeight: 64.h,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            SizedBox(
              width: 28.w,
              height: 28.w,
              child: Center(
                child: Icon(Icons.explore_outlined, size: 20.w, color: AppColors.warning),
              ),
            ),
            Text(
              'Student Portfolio',
              style: GoogleFonts.poppins(
                fontSize: 16.sp,
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
            Spacer(),
            Container(
              width: 36.w,
              height: 36.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.primaryLight, width: 1.w),
                image: DecorationImage(
                  image: NetworkImage('https://i.pravatar.cc/100'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Column(
            children: [
              SizedBox(height: 18.h),

              Expanded(
                flex: 3,
                child: Center(
                  child: Container(
                    width: double.infinity,
                    constraints: BoxConstraints(maxWidth: 420.w),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(24.r),
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.cardBackground,
                            ),
                            child: AspectRatio(
                              aspectRatio: 3 / 4,
                              child: Image.network(
                                students[currentIndex]['image'],
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) => Container(
                                  color: AppColors.cardBackground,
                                  child: Icon(Icons.person, size: 100.w, color: AppColors.textSecondary),
                                ),
                              ),
                            ),
                          ),
                        ),

                        Positioned(
                          top: 18.h,
                          left: 24.w,
                          right: 24.w,
                          child: Container(
                            height: 8.h,
                            decoration: BoxDecoration(
                              color: AppColors.withAlpha(AppColors.background, 0.3),
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: FractionallySizedBox(
                              alignment: Alignment.centerLeft,
                              widthFactor: int.parse(students[currentIndex]['semester']) / 8.0,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xFFDAF24A),
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                              ),
                            ),
                          ),
                        ),

                        Positioned(
                          top: 14.h,
                          right: 24.w,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                            decoration: BoxDecoration(
                              color: const Color(0xFFDAF24A),
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.school, color: AppColors.primaryDark, size: 14.w),
                                SizedBox(width: 4.w),
                                Text(
                                  'Sem ${students[currentIndex]['semester']}',
                                  style: GoogleFonts.poppins(
                                    color: AppColors.primaryDark,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        Positioned(
                          bottom: 24.h,
                          left: 28.w,
                          right: 28.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                students[currentIndex]['name'],
                                style: GoogleFonts.poppins(
                                  color: AppColors.textPrimary,
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.w700,
                                  shadows: [
                                    Shadow(
                                      color: AppColors.withAlpha(Colors.black, 0.5),
                                      blurRadius: 8.r,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                'NRP: ${students[currentIndex]['nrp']}',
                                style: GoogleFonts.poppins(
                                  color: AppColors.textSecondary,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  shadows: [
                                    Shadow(
                                      color: AppColors.withAlpha(Colors.black, 0.5),
                                      blurRadius: 8.r,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 6.h),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                                decoration: BoxDecoration(
                                  color: AppColors.withAlpha(AppColors.primary, 0.8),
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                                child: Text(
                                  students[currentIndex]['skills'],
                                  style: GoogleFonts.poppins(
                                    color: AppColors.textPrimary,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 30.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: _nextProfile,
                    child: Container(
                      width: 70.w,
                      height: 70.w,
                      decoration: BoxDecoration(
                        color: AppColors.withAlpha(AppColors.cardBackground, 0.9),
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.border, width: 2.w),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.withAlpha(Colors.black, 0.25),
                            blurRadius: 12.r,
                            offset: Offset(0, 6.r),
                          ),
                        ],
                      ),
                      child: Icon(Icons.close, color: AppColors.textPrimary, size: 28.w),
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      final student = students[currentIndex];
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (ctx) {
                          return DraggableScrollableSheet(
                            initialChildSize: 0.48,
                            minChildSize: 0.28,
                            maxChildSize: 0.9,
                            expand: false,
                            builder: (_, controller) => Container(
                              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
                              decoration: BoxDecoration(
                                color: AppColors.background,
                                borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
                              ),
                              child: ListView(
                                controller: controller,
                                children: [
                                  Center(
                                    child: Container(
                                      width: 40.w,
                                      height: 5.h,
                                      decoration: BoxDecoration(
                                        color: AppColors.withAlpha(AppColors.textSecondary, 0.3),
                                        borderRadius: BorderRadius.circular(12.r),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 12.h),

                                  Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(12.r),
                                        child: Image.network(
                                          student['image'],
                                          width: 82.w,
                                          height: 82.w,
                                          fit: BoxFit.cover,
                                          errorBuilder: (_, __, ___) => Container(
                                            width: 82.w,
                                            height: 82.w,
                                            color: AppColors.cardBackground,
                                            child: Icon(Icons.person, size: 42.w, color: AppColors.textSecondary),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 12.w),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              student['name'],
                                              style: GoogleFonts.poppins(fontSize: 18.sp, fontWeight: FontWeight.w700, color: AppColors.textPrimary),
                                            ),
                                            SizedBox(height: 6.h),
                                            Text('NRP: ${student['nrp']}', style: GoogleFonts.poppins(color: AppColors.textSecondary)),
                                            SizedBox(height: 4.h),
                                            Text(student['major'], style: GoogleFonts.poppins(color: AppColors.primary)),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),

                                  SizedBox(height: 16.h),

                                  Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                                        decoration: BoxDecoration(
                                          color: AppColors.withAlpha(AppColors.primary, 0.12),
                                          borderRadius: BorderRadius.circular(12.r),
                                        ),
                                        child: Row(
                                          children: [
                                            Icon(Icons.school, size: 14.w, color: AppColors.primary),
                                            SizedBox(width: 8.w),
                                            Text('Semester ${student['semester']}', style: GoogleFonts.poppins(color: AppColors.primaryDark)),
                                          ],
                                        ),
                                      ),
                                      Spacer(),
                                      TextButton.icon(
                                        style: TextButton.styleFrom(padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h)),
                                        onPressed: () {
                                          Navigator.of(ctx).pop();
                                          _showAdaptiveSnackBar(context, 'Copied NRP ${student['nrp']}', backgroundColor: AppColors.primary);
                                        },
                                        icon: Icon(Icons.copy, size: 18.w, color: AppColors.textSecondary),
                                        label: Text('Copy NRP', style: GoogleFonts.poppins(color: AppColors.textSecondary)),
                                      ),
                                    ],
                                  ),

                                  SizedBox(height: 12.h),

                                  Wrap(
                                    spacing: 8.w,
                                    runSpacing: 8.h,
                                    children: (student['skills'] as String).split(',').map((s) {
                                      final skill = s.trim();
                                      return Chip(
                                        backgroundColor: AppColors.withAlpha(AppColors.primaryLight, 0.12),
                                        label: Text(skill, style: GoogleFonts.poppins(fontSize: 12.sp, color: AppColors.textPrimary)),
                                      );
                                    }).toList(),
                                  ),

                                  SizedBox(height: 18.h),

                                  Row(
                                    children: [
                                      Expanded(
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: AppColors.primary,
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                                          ),
                                          onPressed: () {
                                            Navigator.of(ctx).pop();
                                            _showAdaptiveSnackBar(context, 'Contact ${student['name']} (not implemented)', backgroundColor: AppColors.primary);
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(vertical: 12.h),
                                            child: Text('Contact', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 12.w),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(12.r),
                                          border: Border.all(color: AppColors.border),
                                        ),
                                        child: IconButton(
                                          onPressed: () => Navigator.of(ctx).pop(),
                                          icon: Icon(Icons.close, color: AppColors.textSecondary),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      width: 90.w,
                      height: 90.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xFFDAF24A),
                        border: Border.all(color: AppColors.background, width: 3.w),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.withAlpha(Colors.black, 0.25),
                            blurRadius: 15.r,
                            offset: Offset(0, 8.r),
                          ),
                        ],
                      ),
                      child: Icon(Icons.info_outline, color: AppColors.primaryDark, size: 36.w),
                    ),
                  ),

                  GestureDetector(
                    onTap: _nextProfile,
                    child: Container(
                      width: 70.w,
                      height: 70.w,
                      decoration: BoxDecoration(
                        color: AppColors.accent,
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.background, width: 2.w),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.withAlpha(Colors.black, 0.25),
                            blurRadius: 12.r,
                            offset: Offset(0, 6.r),
                          ),
                        ],
                      ),
                      child: Icon(Icons.bookmark, color: Colors.white, size: 28.w),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }
}