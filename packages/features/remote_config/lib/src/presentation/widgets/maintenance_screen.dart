import 'package:designsystem/designsystem.dart';
import 'package:flutter/material.dart';

/// A screen that informs the user that the app is in maintenance mode
class MaintenanceScreen extends StatelessWidget {
  /// Constructor
  const MaintenanceScreen({
    super.key,
    this.title = 'Maintenance in Progress',
    this.message =
        "We're currently performing maintenance to improve your experience. Please try again later.",
    this.icon = Icons.engineering,
  });

  /// The title to display
  final String title;

  /// The message to display
  final String message;

  /// The icon to display
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 120, color: colorScheme.primary),
                const SizedBox(height: 32),
                Text(
                  title,
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  message,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: colorScheme.onSurface.withAlpha(204),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 48),
                AppButton.primary(
                  label: 'Refresh',
                  onPressed: () {
                    // Trigger app reload
                  },
                  icon: const Icon(Icons.refresh),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
