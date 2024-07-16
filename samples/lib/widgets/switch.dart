import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:forui/forui.dart';

import 'package:forui_samples/sample_scaffold.dart';

@RoutePage()
class SwitchPage extends SampleScaffold {
  final bool enabled;

  SwitchPage({
    @queryParam super.theme,
    @queryParam this.enabled = false,
  });

  @override
  Widget child(BuildContext context) => Padding(
        padding: const EdgeInsets.all(16),
        child: FSwitch(enabled: enabled),
      );
}

@RoutePage()
class FormSwitchPage extends SampleScaffold {
  FormSwitchPage({
    @queryParam super.theme,
  });

  @override
  Widget child(BuildContext context) => const Padding(
        padding: EdgeInsets.all(15.0),
        child: NotificationForm(),
      );
}

class NotificationForm extends StatefulWidget {
  const NotificationForm({super.key});

  @override
  State<NotificationForm> createState() => _NotificationFormState();
}

class _NotificationFormState extends State<NotificationForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Email Notifications',
            style: theme.typography.xl2.copyWith(
              fontWeight: FontWeight.w600,
              color: theme.colorScheme.foreground,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 15),
          FCard.raw(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Marketing Emails',
                          style: theme.typography.base.copyWith(
                            fontWeight: FontWeight.w500,
                            color: theme.colorScheme.foreground,
                            height: 1.5,
                          ),
                        ),
                        Text(
                          'Receive emails about new products, features, and more.',
                          style: theme.typography.sm.copyWith(color: theme.colorScheme.mutedForeground),
                        ),
                      ],
                    ),
                  ),
                  const FSwitch(),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          FCard.raw(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Security emails',
                          style: theme.typography.base.copyWith(
                            fontWeight: FontWeight.w500,
                            color: theme.colorScheme.foreground,
                            height: 1.5,
                          ),
                        ),
                        Text(
                          'Receive emails about your account security.',
                          style: theme.typography.sm.copyWith(color: theme.colorScheme.mutedForeground),
                        ),
                      ],
                    ),
                  ),
                  const FSwitch(initialValue: true),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),
          FButton(
            label: const Text('Submit'),
            onPress: () => _formKey.currentState!.validate(),
          ),
        ],
      ),
    );
  }
}
