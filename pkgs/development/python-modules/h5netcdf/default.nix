{ lib
, buildPythonPackage
, fetchPypi
, fetchpatch
, h5py
, pytestCheckHook
, netcdf4
, pythonOlder
, setuptools-scm
}:

buildPythonPackage rec {
  pname = "h5netcdf";
  version = "1.0.1";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-d2cE+s2LgiRtbUBoxQXDibO3C5v5kgzPusfzXNxjTaw=";
  };

 nativeBuildInputs = [
   setuptools-scm
 ];

  propagatedBuildInputs = [
    h5py
  ];

  checkInputs = [
    pytestCheckHook
    netcdf4
  ];

  disabled = pythonOlder "3.6";

  dontUseSetuptoolsCheck = true;

  meta = {
    description = "netCDF4 via h5py";
    homepage = "https://github.com/shoyer/h5netcdf";
    license = lib.licenses.bsd3;
  };

}
