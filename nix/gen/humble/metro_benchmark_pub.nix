{
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_pytest,
  ament_cmake_python,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  metro_benchmark_msgs,
  rclcpp,
  substituteSource,
}:
let
  sources = rec {
    metro_benchmark_pub = substituteSource {
      src = fetchgit {
        name = "metro_benchmark_pub-source";
        url = "https://github.com/ros2-gbp/metrics_msgs-release.git";
        rev = "04cd3175c635d6e077a25d9aae3e1c5773e79272";
        hash = "sha256-HbH6TWjBM8kXgfj8PWOi3q5INg0iaghzo/MJylGUuwI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "metro_benchmark_pub";
  version = "0.1.1-1";
  src = sources.metro_benchmark_pub;
  nativeBuildInputs = [ ament_cmake ament_cmake_python ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ metro_benchmark_msgs rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
