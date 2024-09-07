// Mocks generated by Mockito 5.4.4 from annotations
// in todo/test/task_provider_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i4;
import 'package:todo/models/task.dart' as _i2;
import 'package:todo/services/task_api_service.dart' as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeTask_0 extends _i1.SmartFake implements _i2.Task {
  _FakeTask_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [TaskApiService].
///
/// See the documentation for Mockito's code generation for more information.
class MockTaskApiService extends _i1.Mock implements _i3.TaskApiService {
  MockTaskApiService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get baseUrl => (super.noSuchMethod(
        Invocation.getter(#baseUrl),
        returnValue: _i4.dummyValue<String>(
          this,
          Invocation.getter(#baseUrl),
        ),
      ) as String);

  @override
  set baseUrl(String? _baseUrl) => super.noSuchMethod(
        Invocation.setter(
          #baseUrl,
          _baseUrl,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i5.Future<List<_i2.Task>> fetch() => (super.noSuchMethod(
        Invocation.method(
          #fetch,
          [],
        ),
        returnValue: _i5.Future<List<_i2.Task>>.value(<_i2.Task>[]),
      ) as _i5.Future<List<_i2.Task>>);

  @override
  _i5.Future<_i2.Task> create(_i2.Task? item) => (super.noSuchMethod(
        Invocation.method(
          #create,
          [item],
        ),
        returnValue: _i5.Future<_i2.Task>.value(_FakeTask_0(
          this,
          Invocation.method(
            #create,
            [item],
          ),
        )),
      ) as _i5.Future<_i2.Task>);

  @override
  _i5.Future<_i2.Task> update(_i2.Task? item) => (super.noSuchMethod(
        Invocation.method(
          #update,
          [item],
        ),
        returnValue: _i5.Future<_i2.Task>.value(_FakeTask_0(
          this,
          Invocation.method(
            #update,
            [item],
          ),
        )),
      ) as _i5.Future<_i2.Task>);

  @override
  _i5.Future<void> delete(int? id) => (super.noSuchMethod(
        Invocation.method(
          #delete,
          [id],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
}
