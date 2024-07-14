import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../core/utils/app_utils.dart';
import '../../../core/utils/balloon_utils.dart';
import '../../../core/utils/maps_utils.dart';
import '../../../domain/model/activitiy.dart';
import '../../../service/lg_service.dart';
import '../../components/layout_blueprint.dart';
import '../../components/response_item_card.dart';
import 'bloc/activities_bloc.dart';
import 'bloc/activities_event.dart';
import 'panels/activity_details_card.dart';
import 'panels/activity_input_card.dart';

typedef T = List<Activity>;

class ActivityPage extends StatefulWidget {
  const ActivityPage({super.key});

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  int _selected = 0;
  List<Activity> _activities = [];

  @override
  Widget build(BuildContext context) {
    return LayoutBlueprint(
      cameraPosition: _activities.isNotEmpty
          ? CameraPosition(
        target: LatLng(
          _activities[_selected].latitude,
          _activities[_selected].longitude,
        ),
        zoom: 7,
      ) : null,
      controller: _controller,
      panelLeft: ActivityInputCard(
        onContinueClick: (params) {
          showErrorDialog = true;
          BlocProvider.of<ActivitiesBloc>(context).add(GetActivities(params));
        },
      ),
      panelDividedLeft: blocBuilder<ActivitiesBloc, T>(onSuccess: (result) {
        _activities = result;
        return ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: _activities.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ResponseItemCard(
                  title: _activities[index].name,
                  description: _activities[index].description,
                  label: _activities[index].duration,
                  selected: _selected == index,
                  onTap: () {
                    setState(() {
                      _selected = index;
                    });
                    moveToPlace(
                      _controller,
                      LatLng(
                        _activities[_selected].latitude,
                        _activities[_selected].longitude,
                      ),
                    );
                  },
                ),
                if (index < _activities.length - 1) const SizedBox(height: 8)
              ],
            );
          },
        );
      }),
      panelRight: blocBuilder<ActivitiesBloc, T>(onSuccess: (result) {
        LGService().showBalloon(BalloonUtils().createBalloonForActivity(result[_selected]));
        return ActivityDetailsCard(
          activity: _activities[_selected],
        );
      }),
    );
  }
}
