{ lib
, buildPythonPackage
, fetchFromGitHub
, pythonOlder
, aiohttp
, python-dateutil
, requests
, websockets
}:

buildPythonPackage rec {
  pname = "pytwitchapi";
  version = "2.5.2";
  disabled = pythonOlder "3.7";

  src = fetchFromGitHub {
    owner = "Teekeks";
    repo = "pyTwitchAPI";
    rev = "v${version}";
    sha256 = "sha256-i+oAx23bMu+jaXHPWElD5GJH6vSytW/9N1amsmma4Lc=";
  };

  propagatedBuildInputs = [
    aiohttp
    python-dateutil
    requests
    websockets
  ];

  # Project has no tests.
  doCheck = false;

  pythonImportsCheck = [ "twitchAPI" ];

  meta = with lib; {
    description = "Python implementation of the Twitch Helix API, its Webhook and PubSub";
    homepage = "https://github.com/Teekeks/pyTwitchAPI";
    license = licenses.mit;
    maintainers = with maintainers; [ wolfangaukang ];
  };
}
