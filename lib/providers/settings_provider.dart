import 'package:flutter_riverpod/flutter_riverpod.dart';

// Simplified Settings State (no user settings needed, just a placeholder)
class SettingsState {
  const SettingsState();
}

// Simplified Settings Notifier
class SettingsNotifier extends StateNotifier<SettingsState> {
  SettingsNotifier() : super(const SettingsState());
}

// Provider (kept for backwards compatibility, but not used)
final settingsProvider = StateNotifierProvider<SettingsNotifier, SettingsState>((ref) {
  return SettingsNotifier();
});
