enum NavBarType {
  home(name: "Home"),
  about(name: "About Me"),
  projects(name: "Projects"),
  contact(name: "Contact");

  final String name;
  const NavBarType({required this.name});
}