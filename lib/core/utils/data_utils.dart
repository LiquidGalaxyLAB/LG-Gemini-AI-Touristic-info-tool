String listToBulletPoints(
  List<String> list,
) {
  return list.map((highlight) => '• $highlight').join('\n');
}
