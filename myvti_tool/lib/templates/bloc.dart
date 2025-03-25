import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../shared/common/error_converter.dart';
import '../../../base/base_bloc.dart';
import '../../../base/base_state.dart';
import '../../../base/page_status.dart';

part '{{bloc_snake_case}}_bloc.freezed.dart';
part '{{bloc_snake_case}}_event.dart';
part '{{bloc_snake_case}}_state.dart';

@injectable
class {{bloc_pascal_case}}Bloc extends BaseBloc<{{bloc_pascal_case}}Event, {{bloc_pascal_case}}State> {
  {{bloc_pascal_case}}Bloc() : super(const {{bloc_pascal_case}}State()) {
    on<{{bloc_pascal_case}}Event>((event, emit) async {
        try {
          switch(event) {
            case _LoadData():
              emit(state.copyWith(pageStatus: PageStatus.Loaded));
              break;
          }
        } catch(e,s) {
            handleError(emit, ErrorConverter.convert(e, s));
        }
    });
  }
}