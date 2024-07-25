{
  ament_cmake,
  ament_index_cpp,
  buildRosPackage,
  fastcdr,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rapidjson,
  rclcpp,
  rosbag2_cpp,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    rosx_introspection = substituteSource {
      src = fetchgit {
        name = "rosx_introspection-source";
        url = "https://github.com/ros2-gbp/rosx_introspection-release.git";
        rev = "dd2fff14fc951710ea95e519980d20aa555796a2";
        hash = "sha256-KDdAD97VsAutKy0G0mos5u4TWXUgKW7WetrUOapwPQc=";
      };
      substitutions = [
        {
          path = "cmake/CPM.cmake";
          from = "DOWNLOAD\n     https://github.com/cpm-cmake/CPM.cmake/releases/download/v\${CPM_DOWNLOAD_VERSION}/CPM.cmake";
          to = "DOWNLOAD file://${rosx_introspection-vendor_source-CPM-0}";
        }
      ];
    };
    rosx_introspection-vendor_source-CPM-0 = substituteSource {
      src = fetchurl {
        name = "rosx_introspection-vendor_source-CPM-0-source";
        url = "https://github.com/cpm-cmake/CPM.cmake/releases/download/v0.40.0/CPM.cmake";
        hash = "sha256-ezVPOll2xGJsh2hQyTlE5SyD7FmhWa5d5b55g/Dheio=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosx_introspection";
  version = "1.0.1-1";
  src = sources.rosx_introspection;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ament_index_cpp ];
  buildInputs = [  ];
  propagatedBuildInputs = [ fastcdr rapidjson rclcpp rosbag2_cpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
