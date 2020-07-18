
import 'package:flutter/material.dart';

double padding(BuildContext context) => MediaQuery.of(context).size.width > 1080 ? 64.0 : 16.0;

double heightPadding(BuildContext context) => MediaQuery.of(context).size.height > 720 ? 150.0 : 50.0;