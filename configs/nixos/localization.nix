{ ... }:

{
  # Sets your system timezone.
  time.timeZone = "America/Sao_Paulo";

  # Sets the default system language/locale to US English.
  i18n.defaultLocale = "en_US.UTF-8";
  # Sets specific locale categories (address, measurement, money, etc.)
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };

  # Sets the console keyboard layout
  console.keyMap = "us-acentos";
}
