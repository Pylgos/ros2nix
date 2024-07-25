{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  libusb1,
  nav_msgs,
  nlohmann_json,
  psdk_interfaces,
  rclcpp,
  rclcpp_lifecycle,
  sensor_msgs,
  std_msgs,
  std_srvs,
  substituteSource,
  tf2,
  tf2_ros,
}:
let
  sources = rec {
    psdk_wrapper = substituteSource {
      src = fetchgit {
        name = "psdk_wrapper-source";
        url = "https://github.com/ros2-gbp/psdk_ros2-release.git";
        rev = "1f14033db63e40164efc3f29f8019a251f85866d";
        hash = "sha256-C4y5ZBzg0gW0Nw2bv1S52jAKSyAoV10ayNMlkc8Mcpc=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/dji-sdk/Payload-SDK.git";
          to = "URL ${psdk_wrapper-vendor_source-Payload-SDK-0}";
        }
      ];
    };
    psdk_wrapper-vendor_source-Payload-SDK-0 = substituteSource {
      src = fetchgit {
        name = "psdk_wrapper-vendor_source-Payload-SDK-0-source";
        url = "https://github.com/dji-sdk/Payload-SDK.git";
        rev = "51d8261d625c88bf6fadc7743025cbfc8fdc1e55";
        hash = "sha256-DLS2c/dA5vxrkrlH3MIfbn6VnwVn3RMEd0qs0Pjx2HQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "psdk_wrapper";
  version = "1.3.1-1";
  src = sources.psdk_wrapper;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs libusb1 nav_msgs nlohmann_json psdk_interfaces rclcpp rclcpp_lifecycle sensor_msgs std_msgs std_srvs tf2 tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
