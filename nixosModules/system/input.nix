{...}: {
  hardware.uinput.enable = true;
  users.groups.uinput.members = ["hiimkobeand"];
  users.groups.input.members = ["hiimkobeand"];
}
