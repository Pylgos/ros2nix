{
  ament_cmake,
  ament_cmake_clang_format,
  ament_cmake_cppcheck,
  ament_cmake_cpplint,
  ament_lint_auto,
  as2_behavior,
  as2_core,
  as2_motion_reference_handlers,
  as2_msgs,
  buildRosPackage,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rclcpp,
  rclcpp_components,
  std_msgs,
  std_srvs,
  substituteSource,
  trajectory_msgs,
  visualization_msgs,
}:
let
  sources = rec {
    as2_behaviors_trajectory_generation = substituteSource {
      src = fetchgit {
        name = "as2_behaviors_trajectory_generation-source";
        url = "https://github.com/ros2-gbp/aerostack2-release.git";
        rev = "41848e80f53cd81c96a7621abcf823b28333c1d1";
        hash = "sha256-9i7KRF5c5kPL072uYP3fCbmbkU4CgODu4NItHD0Cflc=";
      };
      substitutions = [
        {
          path = "generate_polynomial_trajectory_behavior/CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/miferco97/dynamic_trajectory_generator.git";
          to = "URL ${as2_behaviors_trajectory_generation-vendor_source-dynamic_trajectory_generator-0}";
        }
      ];
    };
    as2_behaviors_trajectory_generation-vendor_source-dynamic_trajectory_generator-0 = substituteSource {
      src = fetchgit {
        name = "as2_behaviors_trajectory_generation-vendor_source-dynamic_trajectory_generator-0-source";
        url = "https://github.com/miferco97/dynamic_trajectory_generator.git";
        rev = "3bddf06c4a9fc1b32f5abe4406aa70d2c636e026";
        hash = "sha256-cz2Y1KjcEVu5oO5D4eWQqYETJ/SjDeURT5OR9q5Tfrk=";
      };
      substitutions = [
        {
          path = "subpackages/mav_trajectory_generation/cmake_dependencies/glog_dependencies.cmake";
          from = "URL https://github.com/google/glog/archive/4ffa98388f8a28c55b0c8acfbba5f62df954c2a4.zip";
          to = "URL ${as2_behaviors_trajectory_generation-vendor_source-dynamic_trajectory_generator-0-vendor_source-4ffa98388f8a28c55b0c8acfbba5f62df954c2a4-0}";
        }
        {
          path = "subpackages/mav_trajectory_generation/cmake_dependencies/nlopt_dependencies.cmake";
          from = "URL https://github.com/stevengj/NLopt/archive/09b3c2a6da71cabcb98d2c8facc6b83d2321ed71.zip";
          to = "URL ${as2_behaviors_trajectory_generation-vendor_source-dynamic_trajectory_generator-0-vendor_source-09b3c2a6da71cabcb98d2c8facc6b83d2321ed71-0}";
        }
      ];
    };
    as2_behaviors_trajectory_generation-vendor_source-dynamic_trajectory_generator-0-vendor_source-09b3c2a6da71cabcb98d2c8facc6b83d2321ed71-0 = substituteSource {
      src = fetchzip {
        name = "as2_behaviors_trajectory_generation-vendor_source-dynamic_trajectory_generator-0-vendor_source-09b3c2a6da71cabcb98d2c8facc6b83d2321ed71-0-source";
        url = "https://github.com/stevengj/NLopt/archive/09b3c2a6da71cabcb98d2c8facc6b83d2321ed71.zip";
        hash = "sha256-TgieCX7yUdTAEblzXY/gCN0r6F9TVDh4RdNDjQdXZ1o=";
      };
      substitutions = [
      ];
    };
    as2_behaviors_trajectory_generation-vendor_source-dynamic_trajectory_generator-0-vendor_source-4ffa98388f8a28c55b0c8acfbba5f62df954c2a4-0 = substituteSource {
      src = fetchzip {
        name = "as2_behaviors_trajectory_generation-vendor_source-dynamic_trajectory_generator-0-vendor_source-4ffa98388f8a28c55b0c8acfbba5f62df954c2a4-0-source";
        url = "https://github.com/google/glog/archive/4ffa98388f8a28c55b0c8acfbba5f62df954c2a4.zip";
        hash = "sha256-K272RyjC+5Nj9vK+h8nY4+TzY9xjpCudsweI4plJv5I=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "as2_behaviors_trajectory_generation";
  version = "1.0.9-1";
  src = sources.as2_behaviors_trajectory_generation;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [ as2_behavior as2_core as2_motion_reference_handlers as2_msgs eigen geometry_msgs rclcpp rclcpp_components std_msgs std_srvs trajectory_msgs visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
