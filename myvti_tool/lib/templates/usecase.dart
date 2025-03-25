import 'package:injectable/injectable.dart';

import 'use_case.dart';

@injectable
class {{bloc_pascal_case}}UseCase extends UseCase<void, {{bloc_pascal_case}}Param> {
  {{bloc_pascal_case}}UseCase();

  @override
  Future<bool> call({required {{bloc_pascal_case}}Param params}) async {
    // TODO
    return false;
  }
}

class {{bloc_pascal_case}}Param {
  {{bloc_pascal_case}}Param();
}