{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  ros2launch,
  std_srvs,
  substituteSource,
}:
let
  sources = rec {
    catch_ros2 = substituteSource {
      src = fetchgit {
        name = "catch_ros2-source";
        url = "https://github.com/ros2-gbp/catch_ros2-release.git";
        rev = "f6fd8821f90d6816539642fa2d78cb3973da6416";
        hash = "sha256-8+FIcqzIHZrfEeATgko1oxSpJA3YY5lis1+sEd2Y/Rk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "catch_ros2";
  version = "0.2.1-1";
  src = sources.catch_ros2;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp ros2launch std_srvs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
