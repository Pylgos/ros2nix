{
  ament_cmake,
  ament_cmake_gmock,
  ament_cmake_gtest,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  foros_msgs,
  leveldb,
  rclcpp,
  substituteSource,
}:
let
  sources = rec {
    foros = substituteSource {
      src = fetchgit {
        name = "foros-source";
        url = "https://github.com/ros2-gbp/foros-release.git";
        rev = "d5b07dc63208f826b6f351ad1014c96113d1bf23";
        hash = "sha256-3MdLSjVHhSt+I/aMjeUl177ZcPCBGL84NQFFCx4YlP4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "foros";
  version = "0.4.1-2";
  src = sources.foros;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ foros_msgs leveldb rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
