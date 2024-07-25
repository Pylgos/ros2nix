{
  ament_cmake,
  ament_cmake_pytest,
  ament_cmake_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  hri,
  hri_msgs,
  pybind11_vendor,
  python3Packages,
  rclcpp,
  sensor_msgs,
  std_msgs,
  substituteSource,
  tf2_ros_py,
}:
let
  sources = rec {
    pyhri = substituteSource {
      src = fetchgit {
        name = "pyhri-source";
        url = "https://github.com/ros4hri/libhri-release.git";
        rev = "e3267e8680011b03fd129d61fb659e716eaf8619";
        hash = "sha256-NUBF+DntLIclysZjCD1UEDHng0NO/IQv0qhX7VlX2jw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "pyhri";
  version = "2.3.0-1";
  src = sources.pyhri;
  nativeBuildInputs = [ ament_cmake ament_cmake_python ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs hri pybind11_vendor rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
