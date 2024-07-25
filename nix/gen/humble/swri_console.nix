{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  qt5,
  rcl_interfaces,
  rclcpp,
  rosbag2_transport,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    swri_console = substituteSource {
      src = fetchgit {
        name = "swri_console-source";
        url = "https://github.com/ros2-gbp/swri_console-release.git";
        rev = "e4053259ce2604efcc0a325e4dc3d6608a5e4ada";
        hash = "sha256-zA1cDmzrE6co8sEykB922TKHYC0Dzkqfp9Re4OUxMqk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "swri_console";
  version = "2.0.5-2";
  src = sources.swri_console;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.boost qt5.qtbase rcl_interfaces rclcpp rosbag2_transport rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}