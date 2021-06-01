class powershell7::install {

  case $facts['osfamily'] {
    'windows': {
      include powershell7::install::windows
    }
    default: {}
  }
}
