_:
{
  services.pufferpanel = {
    enable = true;
    environment = {
      PUFFER_WEB_HOST = ":8080";
    };
  };
}
