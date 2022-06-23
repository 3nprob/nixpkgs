{ lib
, buildPythonPackage
, fetchPypi
, cffi
, gcc
, wirelesstools
, isPy27
, isPyPy
}:

buildPythonPackage rec {
  pname = "iwlib";
  version = "1.7.0";

  disabled = isPy27 || isPyPy;

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-qAX2WXpw7jABq6jwOft7Lct13BXE54UvVZT9Y3kZbaE=";
  };

  buildInputs = [ gcc ];
  propagatedBuildInputs = [ wirelesstools cffi ];

  meta = {
    description = "Package for interfacing with iwlib, providing an implementation to the wireless tools in Linux.";
    homepage = "https://github.com/nhoad/python-iwlib";
    platforms = lib.platforms.linux;
    license = lib.licenses.gpl2;
  };
}
