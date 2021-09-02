import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:toggl_starter/bloc/tokens_cubit.dart';

class SplashPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    useEffect(() {
      () async {
        await context.read<TokensCubit>().fetch();

        final tokens = context.read<TokensCubit>().state;
        if (!tokens.isValid()) {
          await Navigator.of(context).pushNamed('/configuration');
        }
        await Navigator.of(context).pushReplacementNamed('/task_list');
      }();
    }, []);

    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
