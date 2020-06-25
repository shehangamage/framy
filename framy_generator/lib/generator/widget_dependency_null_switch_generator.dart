String generateWidgetDependencyNullSwitch() => '''
class FramyWidgetDependencyNullSwitch extends StatelessWidget {
  final ValueChanged<dynamic> onChanged;
  final FramyDependencyModel dependency;

  const FramyWidgetDependencyNullSwitch({Key key, this.onChanged, this.dependency})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Switch(
      key: Key('framy_dependency_\${dependency.name}_null_switch'),
      value: dependency.value == null,
      onChanged: (bool isActive) {
        if (isActive) {
          onChanged(null);
        } else {
          onChanged(framyModelConstructorMap[dependency.type]?.call(dependency));
        }
      },
    );
  }
}
''';