import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../presentation/components/data_loading_card.dart';
import '../../presentation/components/invalid_input_dialog.dart';
import '../../presentation/components/no_data_card.dart';
import '../resources/app_state.dart';

var showErrorDialog = true;

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
        if (showErrorDialog) {
          Future.delayed(Duration.zero, () {
            showInvalidInputDialog(
              context,
              title: "Something went wrong",
              description: "Unexpected error occurred, make sure you have provided correct Gemini API key in the settings. If issue still persists try different prompt.",
            );
          });
          showErrorDialog = false;
        }
        return const NoDataCard();
      } else {
        showErrorDialog = true;
        return const NoDataCard();
      }
    },
  );
}

Widget chatBlocBuilder<B extends Bloc<dynamic, AppState<String>>, String>({
  required Widget Function(String) onSuccess,
  required Widget Function() onLoading,
  required Widget Function() onError,
  required Widget Function() onEmpty,
}) {
  return BlocBuilder<B, AppState<String>>(
    builder: (context, state) {
      if (state is AppSuccess && state.data != null) {
        return onSuccess(state.data as String);
      } else if (state is AppLoading) {
        return onLoading();
      } else if (state is AppFailure) {
        Future.delayed(Duration.zero, () {
          showInvalidInputDialog(
            context,
            title: "Something went wrong",
            description: "Unexpected error occurred, make sure you have provided correct Gemini API key in the settings. If issue still persists try different prompt.",
          );
        });
        return onError();
      } else {
        return onEmpty();
      }
    },
  );
}

Future<void> showInvalidInputDialog(
  BuildContext context, {
  String title = "Invalid Input!",
  String description = "Please provide all inputs inorder to get response.",
}) async {
  if (context.mounted) {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return InvalidInputDialog(
          title: title,
          description: description,
        );
      },
    );
  }
}
