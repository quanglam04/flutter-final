import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:prompts/prompts.dart' as prompts;

final templateBasePath = (() {
  final currentExeDir = File(Platform.script.toFilePath()).absolute.parent;
  final rootDir = currentExeDir.path.contains('bin')
      ? currentExeDir.parent
      : currentExeDir; // fallback nếu chưa compile
  return p.normalize(p.join(rootDir.path, 'lib', 'templates'));
})();

String _promptPascalCaseName() {
  final pascalCaseRegExp = RegExp(r'^[A-Z][a-zA-Z0-9]*\$?');

  while (true) {
    stdout.write('📦 Nhập tên (PascalCase): ');
    final bytes = <int>[];

    while (true) {
      final byte = stdin.readByteSync();
      if (byte == 10 || byte == 13) {
        break; // Enter key (\n or \r)
      }
      bytes.add(byte);
    }

    final input = String.fromCharCodes(bytes).trim();

    if (pascalCaseRegExp.hasMatch(input)) {
      return input;
    } else {
      print('❌ Tên phải đúng định dạng PascalCase (Ví dụ: Login)');
    }
  }
}

String _sanitizePascalCase(String input) {
  // Chỉ giữ lại A-Z, a-z, 0-9
  final clean = input.replaceAll(RegExp(r'[^A-Za-z0-9]'), '');
  return clean;
}

void main(List<String> arguments) async {
  print('🚀 Flutter BLoC Generator CLI with Dart');

  final generate = prompts.choose('📌 Bạn muốn tạo gì?', [
    'Page',
    'UseCase',
    'Repository',
    'DataSource',
    'Build Runner',
  ]);

  if (generate == 'Build Runner') {
    final process = await Process.start('dart', [
      'run',
      'build_runner',
      'build',
      '--delete-conflicting-outputs',
    ]);

    process.stdout.transform(const SystemEncoding().decoder).listen(stdout.write);
    process.stderr.transform(const SystemEncoding().decoder).listen(stderr.write);

    await process.exitCode;
    return;
  }

  final rawName = _promptPascalCaseName();
  final name = _sanitizePascalCase(rawName);
  final snakeCase = _toSnakeCase(name);

  final replacements = {
    '{{bloc_pascal_case}}': name,
    '{{bloc_snake_case}}': snakeCase,
  };

  if (generate == 'Page') {
    final outDir = 'lib/presentation/view/pages/$snakeCase';
    generateFromTemplate(
      templateName: 'bloc.dart',
      outputPath: '$outDir/${snakeCase}_bloc.dart',
      replacements: replacements,
    );

    generateFromTemplate(
      templateName: 'event.dart',
      outputPath: '$outDir/${snakeCase}_event.dart',
      replacements: replacements,
    );

    generateFromTemplate(
      templateName: 'state.dart',
      outputPath: '$outDir/${snakeCase}_state.dart',
      replacements: replacements,
    );

    generateFromTemplate(
      templateName: 'page.dart',
      outputPath: '$outDir/${snakeCase}_page.dart',
      replacements: replacements,
    );

    updateRouterFile(name, snakeCase, 'lib/presentation/router/router.dart');
  } else if (generate == 'UseCase') {
    generateFromTemplate(
      templateName: 'usecase.dart',
      outputPath: 'lib/domain/usecases/${snakeCase}_use_case.dart',
      replacements: replacements,
    );
  } else if (generate == 'Repository') {
    generateFromTemplate(
      templateName: 'repository_interface.dart',
      outputPath: 'lib/domain/repositories/${snakeCase}_repository.dart',
      replacements: replacements,
    );

    generateFromTemplate(
      templateName: 'repository_impl.dart',
      outputPath: 'lib/data/repositories/${snakeCase}_repository_impl.dart',
      replacements: replacements,
    );
  } else if (generate == 'DataSource') {
    generateFromTemplate(
      templateName: 'datasource.dart',
      outputPath: 'lib/data/remote/datasources/${snakeCase}_remote_data_source.dart',
      replacements: replacements,
    );
  }
}

void generateFromTemplate({
  required String templateName,
  required String outputPath,
  required Map<String, String> replacements,
}) {
  final templatePath = p.join(templateBasePath, templateName);
  final templateFile = File(templatePath);

  if (!templateFile.existsSync()) {
    print('❌ Không tìm thấy file template: \$templatePath');
    exit(1);
  }

  String content = templateFile.readAsStringSync();
  replacements.forEach((key, value) {
    content = content.replaceAll(key, value);
  });

  final outputFile = File(outputPath);
  outputFile.createSync(recursive: true);
  outputFile.writeAsStringSync(content);
  print('✅ Đã tạo: ${File(outputPath).absolute.uri}');
}

void updateRouterFile(String className, String snakeCase, String routerFilePath) {
  final file = File(routerFilePath);
  if (!file.existsSync()) {
    print('❌ Không tìm thấy file router: $routerFilePath');
    return;
  }

  String content = file.readAsStringSync();

  final importLine = "import '../view/pages/$snakeCase/${snakeCase}_page.dart';";
  final routeEntry = "AutoRoute(page: ${className}Route.page),";

  // 1. ✅ Thêm import nếu chưa có
  if (!content.contains(importLine)) {
    final insertAfter = "import 'package:auto_route/auto_route.dart';";
    content = content.replaceFirst(
      insertAfter,
      "$insertAfter\n\n$importLine",
    );
  }

  // 2. ✅ Thêm AutoRoute(...) vào cuối danh sách routes nếu chưa có
  if (!content.contains(routeEntry)) {
    final listStart = content.indexOf('  final List<AutoRoute> routes = [');
    final listEnd = content.indexOf('  ];', listStart);
    if (listEnd != -1) {
      content = content.replaceRange(
        listEnd,
        listEnd,
        '    $routeEntry\n',
      );
    }
  }

  file.writeAsStringSync(content);
  print('✅ Đã thêm ${className}Route vào router.dart');
}


String _toSnakeCase(String input) {
  return input
      .replaceAllMapped(RegExp(r'[A-Z]'),
          (match) => '_${match.group(0)!.toLowerCase()}')
      .replaceFirst('_', '');
}