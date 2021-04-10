import 'package:flutter/material.dart';

Widget showCircleProgress({double size = 30}) => Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: size,
        height: size,
        child: CircularProgressIndicator(),
      ),
    );
