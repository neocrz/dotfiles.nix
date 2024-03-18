{
  hosts = {
    h1 = {
      system = "x86_64-linux";
      hostname = "a5";

      # DESC
      model = "Acer aspire 5";
      nvidia = true;
    };
    h2 = {
      system = "aarch64-linux";
      hostname = "droid";

      model = "Xiaomi MI 9";
    };
  };

  user = {
    name = "neocrz";
    email = "neo59crz@gmail.com";
  };
  de = "hyprland"; 
}