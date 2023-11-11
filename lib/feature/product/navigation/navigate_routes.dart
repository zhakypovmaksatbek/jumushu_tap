enum NavigateRoutes {
  home,
}

extension NavigateExtension on NavigateRoutes {
  String get withParaf => "/$name";
}
