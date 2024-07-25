{
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ruckig = substituteSource {
      src = fetchgit {
        name = "ruckig-source";
        url = "https://github.com/ros2-gbp/ruckig-release.git";
        rev = "05a4e90a14abd2629b2901f755e36139731b1b03";
        hash = "sha256-xzv0PejVB2frTXtd7fnF72E49MOQaARx6boGHYzyVnQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ruckig";
  version = "0.9.2-4";
  src = sources.ruckig;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
