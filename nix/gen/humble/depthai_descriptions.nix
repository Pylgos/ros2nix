{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  robot_state_publisher,
  substituteSource,
  xacro,
}:
let
  sources = rec {
    depthai_descriptions = substituteSource {
      src = fetchgit {
        name = "depthai_descriptions-source";
        url = "https://github.com/luxonis/depthai-ros-release.git";
        rev = "3f33f92593b00215e907f0dd2a2416f7f2c1f906";
        hash = "sha256-P8c6aJ/H9r0k/Ne7o8PZVbhmQQdG2hioVM6t/PuLXnQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "depthai_descriptions";
  version = "2.9.0-1";
  src = sources.depthai_descriptions;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ robot_state_publisher xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
