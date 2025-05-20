let
  # Set username
  user1 = "yu3liang";
in
  {
    # Set desktop user
    desktop = "tuxedo";
    user1 = user1;

    # Set home directory
    homeDirectoryUser1 = "/home/${user1}";
  }