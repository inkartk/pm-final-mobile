import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Settings State Class
class SettingsState {
  final bool isDarkMode;
  final bool isPresentationMode;
  final String defaultSymbol;

  SettingsState({
    this.isDarkMode = false,
    this.isPresentationMode = false,
    this.defaultSymbol = 'BTCUSDT',
  });

  SettingsState copyWith({
    bool? isDarkMode,
    bool? isPresentationMode,
    String? defaultSymbol,
  }) {
    return SettingsState(
      isDarkMode: isDarkMode ?? this.isDarkMode,
      isPresentationMode: isPresentationMode ?? this.isPresentationMode,
      defaultSymbol: defaultSymbol ?? this.defaultSymbol,
    );
  }
}

// Settings Notifier
class SettingsNotifier extends StateNotifier<SettingsState> {
  SettingsNotifier() : super(SettingsState()) {
    _loadSettings();
  }

  // Load settings from SharedPreferences
  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    state = SettingsState(
      isDarkMode: prefs.getBool('isDarkMode') ?? false,
      isPresentationMode: prefs.getBool('isPresentationMode') ?? false,
      defaultSymbol: prefs.getString('defaultSymbol') ?? 'BTCUSDT',
    );
  }

  // Toggle dark mode
  Future<void> toggleDarkMode() async {
    final newValue = !state.isDarkMode;
    state = state.copyWith(isDarkMode: newValue);

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', newValue);
  }

  // Toggle presentation mode
  Future<void> togglePresentationMode() async {
    final newValue = !state.isPresentationMode;
    state = state.copyWith(isPresentationMode: newValue);

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isPresentationMode', newValue);
  }

  // Set default symbol
  Future<void> setDefaultSymbol(String symbol) async {
    state = state.copyWith(defaultSymbol: symbol);

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('defaultSymbol', symbol);
  }
}

// Provider
final settingsProvider = StateNotifierProvider<SettingsNotifier, SettingsState>((ref) {
  return SettingsNotifier();
});
