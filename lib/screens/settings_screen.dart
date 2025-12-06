import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/settings_provider.dart';
import '../utils/constants.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Настройки'),
      ),
      body: ListView(
        children: [
          // Dark Mode Section
          Card(
            margin: const EdgeInsets.all(AppSizes.paddingMedium),
            child: SwitchListTile(
              title: const Text('Тёмная тема'),
              subtitle: const Text('Переключить между светлой и тёмной темой'),
              value: settings.isDarkMode,
              onChanged: (_) => ref.read(settingsProvider.notifier).toggleDarkMode(),
              secondary: Icon(
                settings.isDarkMode ? Icons.dark_mode : Icons.light_mode,
              ),
            ),
          ),

          // Presentation Mode Section
          Card(
            margin: const EdgeInsets.symmetric(
              horizontal: AppSizes.paddingMedium,
              vertical: AppSizes.paddingSmall,
            ),
            child: SwitchListTile(
              title: const Text('Режим презентации'),
              subtitle: const Text('Увеличенные шрифты для демонстрации'),
              value: settings.isPresentationMode,
              onChanged: (_) => ref.read(settingsProvider.notifier).togglePresentationMode(),
              secondary: const Icon(Icons.slideshow),
            ),
          ),

          // Trading Symbol Section
          Card(
            margin: const EdgeInsets.symmetric(
              horizontal: AppSizes.paddingMedium,
              vertical: AppSizes.paddingSmall,
            ),
            child: Padding(
              padding: const EdgeInsets.all(AppSizes.paddingMedium),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.currency_bitcoin),
                      const SizedBox(width: 16),
                      Text(
                        'Торговая пара по умолчанию',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    children: AppStrings.tradingSymbols.map((symbol) {
                      final isSelected = settings.defaultSymbol == symbol;
                      return ChoiceChip(
                        label: Text(symbol),
                        selected: isSelected,
                        onSelected: (_) {
                          ref.read(settingsProvider.notifier).setDefaultSymbol(symbol);
                        },
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          // About Section
          Card(
            margin: const EdgeInsets.symmetric(
              horizontal: AppSizes.paddingMedium,
              vertical: AppSizes.paddingSmall,
            ),
            child: Padding(
              padding: const EdgeInsets.all(AppSizes.paddingLarge),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'О приложении',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const Divider(),
                  const SizedBox(height: 8),
                  _buildInfoRow('Название', AppStrings.appName),
                  _buildInfoRow('Версия', AppStrings.appVersion),
                  const SizedBox(height: 8),
                  Text(
                    AppStrings.appDescription,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.orange.shade50,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.warning_amber, color: Colors.orange.shade700),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'Это учебный проект. Все сделки симулированы.',
                            style: TextStyle(
                              color: Colors.orange.shade900,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(color: Colors.grey),
          ),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
