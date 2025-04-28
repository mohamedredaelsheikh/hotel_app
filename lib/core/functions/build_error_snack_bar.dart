import 'package:flutter/material.dart';
import 'package:hotel_app/core/constants/constants.dart';

void showErrorSnackBar(BuildContext context, String errMessage) {
  // إزالة أي SnackBar موجودة قبل عرض واحدة جديدة
  ScaffoldMessenger.of(context).removeCurrentSnackBar();

  // عرض SnackBar المحسنة
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          // أيقونة خطأ
          const Icon(Icons.error_outline, color: Colors.white, size: 24),
          const SizedBox(width: 10),
          // نص الرسالة
          Expanded(
            child: Text(
              errMessage,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: kPrimaryColor.withOpacity(0.9), // لون الخلفية مع شفافية
      behavior: SnackBarBehavior.floating, // عشان تبقى عائمة
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // حواف مدورة
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ), // هامش خارجي
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ), // مسافات داخلية
      duration: const Duration(seconds: 4), // مدة أطول شوية
      action: SnackBarAction(
        label: 'Dismiss',
        textColor: Colors.white,
        onPressed: () {
          // إغلاق الـ SnackBar يدويًا
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
      elevation: 6, // ظل خفيف للعمق
    ),
  );
}
