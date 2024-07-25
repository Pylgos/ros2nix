{
  ament_cmake,
  ament_cmake_gmock,
  ament_cmake_gtest,
  beluga,
  beluga_ros,
  bondcpp,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  message_filters,
  rclcpp,
  rclcpp_components,
  rclcpp_lifecycle,
  std_srvs,
  substituteSource,
}:
let
  sources = rec {
    beluga_amcl = substituteSource {
      src = fetchgit {
        name = "beluga_amcl-source";
        url = "https://github.com/ros2-gbp/beluga-release.git";
        rev = "6fc6eae2f642c6440457488681e1c69e05c94535";
        hash = "sha256-o5w8tS4fYcmaf9rRYPabtPGEs27Xf50+6nRPhhPN7B8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "beluga_amcl";
  version = "2.0.2-1";
  src = sources.beluga_amcl;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ beluga beluga_ros bondcpp message_filters rclcpp rclcpp_components rclcpp_lifecycle std_srvs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
