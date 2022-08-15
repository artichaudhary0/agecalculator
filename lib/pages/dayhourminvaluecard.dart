 import 'package:flutter/material.dart';

Widget summaryValues({required String textValue, required String value}) {
    return Column(
      children: [
        Text(
          textValue,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 18,
          ),
        ),
      ],
    );
  }