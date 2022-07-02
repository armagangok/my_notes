import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class EditTextController extends GetxController {
  final TextEditingController _editTitleController = TextEditingController();
  final TextEditingController _editContentController = TextEditingController();
  TextEditingController get editTitleController => _editTitleController;
  TextEditingController get editContentController => _editContentController;
}

class SearchtextController extends GetxController {
  final TextEditingController _searchController = TextEditingController();
  TextEditingController get searchController => _searchController;
}

class TakeNoteTextController extends GetxController {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  TextEditingController get titleController => _titleController;
  TextEditingController get contentController => _contentController;
}
