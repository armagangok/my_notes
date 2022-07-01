import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class TextController extends GetxController {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();

  TextEditingController get titleController => _titleController;
  TextEditingController get contentController => _contentController;
  TextEditingController get searchController => _searchController;
}
