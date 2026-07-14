import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  const HomeCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        // O tamanho do ícone depende do card
        final iconBoxSize = (width * 0.10).clamp(45.0, 45.0);
        final iconSize = iconBoxSize * 0.55;
        final titleSize = (width * 0.045).clamp(16.0, 22.0);
        final subtitleSize = (width * 0.04).clamp(12.0, 16.0);

        return InkWell(
          onTap: onTap,
          //borderRadius: BorderRadius.circular(1.r),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.04,
              vertical: width * 0.10,
            ),

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.06),
                  blurRadius: 10, 
                  offset: const Offset(0, 5),
                ),
              ],
            ),

            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: iconBoxSize,
                  height: iconBoxSize,
                  decoration: const BoxDecoration(
                    color: Color(0xff0B4A46),
                    shape: BoxShape.circle,
                  ),

                  child: Icon(
                    icon,
                    size: iconSize,
                    color: Colors.white,
                  ),
                ),

                SizedBox(
                  width: width * 0.049,
                ),

                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(
                        title,
                        style: TextStyle(
                          fontSize: titleSize,
                          fontWeight: FontWeight.w700,
                          color: Colors.black87,
                        ),
                      ),

                      SizedBox(height: 6.h),

                      Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: subtitleSize,
                          color: Colors.grey.shade600,
                          height: 1.0,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  width: width * 0.02,
                ),

                Icon(
                  Icons.chevron_right_rounded,
                  size: iconBoxSize * 0.05,
                  color: const Color(0xff0B4A46),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}