let
  # Set username
  user1 = "yu3liang";

  # Set desktop
  desktop = "tuxedo";
in
  {
    user1 = user1;
    desktop = desktop;
    homeDirectoryUser1 = "/home/${user1}";
  }