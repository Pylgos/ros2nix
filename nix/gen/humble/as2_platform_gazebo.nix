{
  ament_cmake,
  ament_cmake_clang_format,
  ament_cmake_cppcheck,
  ament_cmake_cpplint,
  ament_lint_auto,
  as2_core,
  as2_gazebo_assets,
  as2_msgs,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rclcpp,
  substituteSource,
}:
let
  sources = rec {
    as2_platform_gazebo = substituteSource {
      src = fetchgit {
        name = "as2_platform_gazebo-source";
        url = "https://github.com/ros2-gbp/aerostack2-release.git";
        rev = "d948a2b04dae166cabbbfffaed9d2f80201449b2";
        hash = "sha256-e5qFTanBnEMth21paFyPap0i7zWL4SnEw1cqSQeNcPI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "as2_platform_gazebo";
  version = "1.0.9-1";
  src = sources.as2_platform_gazebo;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ as2_core as2_gazebo_assets as2_msgs geometry_msgs rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
