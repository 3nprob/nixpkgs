{ lib
, buildPythonPackage
, fetchPypi
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
    sha256 = "1ajmflvvlkflrcmqmkrx0zaira84z8kv4ssb2jprfwvjh8vfkysb";
  };

  buildInputs = [ gcc ];
  propagatedBuildInputs = [ wirelesstools ];

  meta = {
    description = "Package for interfacing with iwlib, providing an implementation to the wireless tools in Linux.";
    homepage = "https://github.com/nhoad/python-iwlib";
    platforms = lib.platforms.linux;
    license = lib.licenses.gpl2;
  };
}
