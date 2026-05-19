import 'package:flutter/material.dart';
import 'package:trana/core/theme/app_theme.dart';

void showErrorSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        padding: EdgeInsets.symmetric(vertical: 0),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
        duration: const Duration(seconds: 2),
        content: Container(
          height: 48,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Color(0xFF41444F).withOpacity(0.5),
          ),
          child: Row(
            children: [
              Container(
                height: 18,
                width: 18,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: fxc(context).statusError,
                ),
                child: Center(
                  child: Icon(
                    Icons.close,
                    size: 10,
                    color: fxc(context).textBrand,
                  ),
                ),
              ),
              SizedBox(width: 8),
              Text(
                message,
                style: TextStyle(
                  color: fxc(context).textBrand,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
}
