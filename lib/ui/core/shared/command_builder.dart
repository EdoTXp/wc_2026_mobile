import 'package:material_ui/material_ui.dart';
import 'package:wc_2026_mobile/core/command.dart';
import 'package:wc_2026_mobile/core/result.dart';
import 'package:wc_2026_mobile/ui/core/shared/app_loading.dart';
import 'package:wc_2026_mobile/ui/core/shared/error_indicator.dart';
import 'package:wc_2026_mobile/ui/core/shared/error_messages.dart';

typedef CommandGetData<T> = T? Function();
typedef CommandDataBuilder<T> = Widget Function(T data);
typedef CommandLoadingBuilder = Widget Function(
  BuildContext context,
  Widget loaderWidget,
);

class const CommandBuilder<T>({
  super.key,
  required final Command _asyncCommand,
  required final CommandGetData<T> _data,
  required final CommandDataBuilder<T> _builder,
  final CommandLoadingBuilder? _loading,
  final VoidCallback? _retry,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _asyncCommand,
      builder: (context, _) => _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    if (_asyncCommand.running) {
      final loaderWidget = AppLoading();
      return _loading?.call(context, loaderWidget) ?? loaderWidget;
    }

    if (_asyncCommand.result case Error(:final error)) {
      return ErrorIndicator(
        title: ErrorMessages.of(error),
        label: 'Tentar Novamente',
        onPressed: _retry?.call ?? () {},
      );
    }

    if (_data() case final result?) {
      return _builder(result);
    }

    return const SizedBox.shrink();
  }
}
