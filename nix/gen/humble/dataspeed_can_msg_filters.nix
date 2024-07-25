{
  ament_cmake,
  ament_cmake_gtest,
  buildRosPackage,
  can_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  substituteSource,
}:
let
  sources = rec {
    dataspeed_can_msg_filters = substituteSource {
      src = fetchgit {
        name = "dataspeed_can_msg_filters-source";
        url = "https://github.com/DataspeedInc-release/dataspeed_can-release.git";
        rev = "3233a546d7c2cdc187462de7444de845541b87bc";
        hash = "sha256-dC1Ryzzvx7M9aQYxxBfXB4xFCa9nQHy8dO/Us9z+94c=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "dataspeed_can_msg_filters";
  version = "2.0.1-1";
  src = sources.dataspeed_can_msg_filters;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ can_msgs rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
