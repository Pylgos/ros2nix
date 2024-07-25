{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  libusb1,
  nlohmann_json,
  opencv,
  ros_environment,
  substituteSource,
}:
let
  sources = rec {
    depthai = substituteSource {
      src = fetchgit {
        name = "depthai-source";
        url = "https://github.com/luxonis/depthai-core-release.git";
        rev = "15c46b71823dfd5ee144e66b05207843a76e861a";
        hash = "sha256-ZlZa5BCuio603aG8TEheR/fHVoz4ugUeX7kXi2FK6Qk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "depthai";
  version = "2.26.1-1";
  src = sources.depthai;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ libusb1 nlohmann_json opencv ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
