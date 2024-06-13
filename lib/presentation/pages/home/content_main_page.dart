import 'package:flutter/material.dart';
import 'package:flutter_resizable_container/flutter_resizable_container.dart';
import 'package:touristic/core/enums/app_feature.dart';
import 'package:touristic/presentation/widgets/maps_widget.dart';

class ContentMainPage extends StatefulWidget {
  final AppFeature feature;
  const ContentMainPage({super.key, required this.feature});

  @override
  State<ContentMainPage> createState() => _ContentMainPageState();
}

class _ContentMainPageState extends State<ContentMainPage> {
  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context);

    return ResizableContainer(
      direction: Axis.horizontal,
      controller: ResizableController(),
      divider: ResizableDivider(
        thickness: 5,
        size: 5,
        indent: 5,
        endIndent: 5,
      ),
      children: [
        ResizableChild(
          minSize: query.size.width * 0.4,
          child: Container(
            color: Colors.redAccent,
          ),
        ),
        ResizableChild(
          minSize: query.size.width * 0.3,
          child: ResizableContainer(
            direction: Axis.vertical,
            divider: ResizableDivider(
              thickness: 5,
              size: 5,
              indent: 5,
              endIndent: 5,
            ),
            children: [
              ResizableChild(
                minSize: query.size.height * 0.4,
                child: Container(
                  color: Colors.blueAccent,
                ),
              ),
              ResizableChild(
                minSize: query.size.height * 0.4,
                child: MapsWidget(),
              ),
            ],
          ),
        )
      ],
    );
  }
}
