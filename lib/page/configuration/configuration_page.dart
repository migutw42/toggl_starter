import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:toggl_starter/bloc/tokens_cubit.dart';
import 'package:toggl_starter/entity/tokens.dart';
import 'package:url_launcher/url_launcher.dart';

class ConfigurationPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final tokens = context.watch<TokensCubit>().state;

    final todoistTokenController = useTextEditingController();
    final togglTokenController = useTextEditingController();

    useEffect(() {
      todoistTokenController.text = tokens.todoist;
      togglTokenController.text = tokens.toggl;

      return () {};
    }, [tokens]);

    return Scaffold(
      appBar: AppBar(
        title: Text('Configuration'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: todoistTokenController,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter your Todoist token.',
              ),
            ),
            TextField(
              controller: togglTokenController,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter your Toggl token.',
              ),
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () => _save(context, todoistTokenController.text,
                  togglTokenController.text),
              child: Text('save'),
            ),
            SizedBox(
              height: 32,
            ),
            ElevatedButton(
              onPressed: () {
                launch('https://todoist.com/app/settings/integrations#');
              },
              child: Text('open todoist token page'),
            ),
            SizedBox(
              height: 8,
            ),
            ElevatedButton(
              onPressed: () {
                launch('https://track.toggl.com/profile');
              },
              child: Text('open toggl token page'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _save(
      BuildContext context, String todoistToken, String togglToken) async {
    await context.read<TokensCubit>().save(
          Tokens(toggl: togglToken, todoist: todoistToken),
        );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Saved'),
      ),
    );
  }
}
