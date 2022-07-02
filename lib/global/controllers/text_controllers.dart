import 'package:flutter/material.dart';

class EditTextController {
  final TextEditingController _editTitleController = TextEditingController();
  final TextEditingController _editContentController = TextEditingController();
  TextEditingController get editTitleController => _editTitleController;
  TextEditingController get editContentController => _editContentController;
}

class SearchtextController {
  final TextEditingController _searchController = TextEditingController();
  TextEditingController get searchController => _searchController;
}

class TakeNoteTextController {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  TextEditingController get titleController => _titleController;
  TextEditingController get contentController => _contentController;
}
