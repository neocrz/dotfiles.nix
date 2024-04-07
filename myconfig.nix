{
  hosts = {
    h1 = {
      
      system = "x86_64-linux";
      hostname = "a5";

      # DESC
      model = "Acer aspire 5";
      nvidia = true; # Unused
      hybrid = true;

      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:2:0:0";

      timeZone = "America/Sao_Paulo";
      defaultLocale = "en_US.UTF-8";
      extraLocale = "pt_BR.UTF-8";
      
      keyMap = "br-abnt2";
      layout = "br";

    };

    h2 = {

      system = "aarch64-linux";
      hostname = "droid";

      model = "Xiaomi MI 9";

    };

    h3 = {

      system = "x86_64-linux";
      hostname = "artix";

    };
  };

  user = {
    name = "neocrz";
    email = "neo59crz@gmail.com";
  };
  de = "cinnamon"; # cinnamon gnome
  host = "h1";
}
