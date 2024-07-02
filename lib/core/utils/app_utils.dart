import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../presentation/components/data_loading_card.dart';
import '../../presentation/components/no_data_card.dart';
import '../resources/app_state.dart';

void setPreferredOrientations(BuildContext context) {
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
}

Widget blocBuilder<B extends Bloc<dynamic, AppState<S>>, S>({
  required Widget Function(S) onSuccess,
}) {
  return BlocBuilder<B, AppState<S>>(
    builder: (context, state) {
      if (state is AppSuccess) {
        if (state.data != null) {
          return onSuccess(state.data as S);
        } else {
          return const NoDataCard();
        }
      } else if (state is AppLoading) {
        return const DataLoadingCard();
      } else if (state is AppFailure) {
        return const NoDataCard();
      } else {
        return const NoDataCard();
      }
    },
  );
}

Widget chatBlocBuilder<B extends Bloc<dynamic, AppState<String>>, String>({
  required Function(String) onSuccess,
  required Widget content,
}) {
  return BlocBuilder<B, AppState<String>>(
    builder: (context, state) {
      if (state is AppSuccess && state.data != null) {
        onSuccess(state.data as String);
      }
      return content;
    },
  );
}
