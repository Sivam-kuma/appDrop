import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import '../helpers/component_parser.dart';


class PageProvider with ChangeNotifier {
  List<dynamic> components = [];
  bool isLoading = true;

  Future<void> loadPage() async {
    final jsonString = await rootBundle.loadString("assets/page.json");
    final data = jsonDecode(jsonString);

    final list = data["page"]["components"] as List;

    components = ComponentParser.parseComponents(list);

    isLoading = false;
    notifyListeners();
  }
}
