{
  ament_cmake,
  buildRosPackage,
  depthai,
  depthai_bridge,
  depthai_descriptions,
  depthai_examples,
  depthai_filters,
  depthai_ros_driver,
  depthai_ros_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    depthai-ros = substituteSource {
      src = fetchgit {
        name = "depthai-ros-source";
        url = "https://github.com/luxonis/depthai-ros-release.git";
        rev = "efff0ced5b6910083d205d2f4601863ee61258d0";
        hash = "sha256-uWj5f9Jd0HJvVMQpfkP9QSYe7+G1RpPCL75rM4vyhuA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "depthai-ros";
  version = "2.9.0-1";
  src = sources.depthai-ros;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ depthai depthai_bridge depthai_descriptions depthai_examples depthai_filters depthai_ros_driver depthai_ros_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
