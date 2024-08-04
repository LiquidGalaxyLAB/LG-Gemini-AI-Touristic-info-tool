import '../../config/theme/app_theme.dart';
import 'data_utils.dart';

String _createH2(String text) {
  String color = AppTheme.color.shade800.toHex();
  String fontSize = "26px";
  return '<h2 style="color:$color; margin: 0; font-size:$fontSize;">$text</h2>';
}

String _createP(String text) {
  String color = AppTheme.color.shade900.toHex();
  String fontSize = "24px";
  return '<p style="color:$color; margin: 0; font-size:$fontSize;">$text</p>';
}

String _createCard(String label, String content, int level) {
  String padding = "20px";
  String margin = "20px";
  String corners = "22px";
  String background = level == 0 ? AppTheme.color.shade300.toHex() : AppTheme.color.shade100.toHex();

  return '''
  <div style="background-color:$background; padding:$padding; margin-top:$margin; border-radius:$corners;">
    ${_createH2(label)}
    ${_createP(content)}
  </div>''';
}

String createHeading(String text) {
  String fontSize = "28px";
  String color = AppTheme.color.shade700.toHex();
  return '<h1 style="color:$color; margin: 0; font-size:$fontSize;">$text</h1>';
}

String createInnerCard(String label, String content) {
  return '''
  ${_createH2(label)}
  ${_createP(content)}
  <br/>''';
}

String createItemCard(String text, {bool surroundWithP = false}) {
  String padding = "20px";
  String margin = "20px";
  String corners = "22px";
  String background = AppTheme.color.shade200.toHex();

  return '''
  <div style="background-color:$background; padding:$padding; margin-top:$margin; border-radius:$corners;">
    ${!surroundWithP ? text : _createP(text)}
  </div>''';
}

String createListItems(List<String> items) {
  return items.map((item) => _createP(item)).join();
}

String createSectionCard(
  String label,
  String content, {
  int level = 0,
}) {
  return _createCard(label, content, level);
}

String createUnorderedList(List<String> items) {
  String fontSize = "18px";
  String color = AppTheme.color.shade800.toHex();

  return '''
  <ul style="list-style-type: disc; color: $color; font-size: $fontSize">
    ${items.map((item) => '<li style="margin-bottom: 5px;">$item</li>').join()}
  </ul>''';
}
