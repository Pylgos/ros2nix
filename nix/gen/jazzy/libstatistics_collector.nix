{
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  performance_test_fixture,
  rcl,
  rcpputils,
  rcutils,
  rmw,
  rosidl_default_generators,
  rosidl_default_runtime,
  statistics_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    libstatistics_collector = substituteSource {
      src = fetchgit {
        name = "libstatistics_collector-source";
        url = "https://github.com/ros2-gbp/libstatistics_collector-release.git";
        rev = "19d619f753118a3cae6e41d2f9974d9a37fea539";
        hash = "sha256-cvI6rweNMAPnISrPDjCi0dRMq6O79AA7JWqrBt01vEA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "libstatistics_collector";
  version = "1.7.3-1";
  src = sources.libstatistics_collector;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake_ros rmw ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rcl rcpputils statistics_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
