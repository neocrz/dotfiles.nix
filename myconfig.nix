{
  hosts = {
    h1 = {
      
      system = "x86_64-linux";
      hostname = "a5";

      # DESC
      model = "Acer aspire 5";
      nvidia = true;
      hybrid = true;

      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:2:0:0";

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
  de = "cinnamon"; 
  host = "h1";
}