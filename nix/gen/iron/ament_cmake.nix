{
  ament_cmake_core,
  ament_cmake_export_definitions,
  ament_cmake_export_dependencies,
  ament_cmake_export_include_directories,
  ament_cmake_export_interfaces,
  ament_cmake_export_libraries,
  ament_cmake_export_link_flags,
  ament_cmake_export_targets,
  ament_cmake_gen_version_h,
  ament_cmake_libraries,
  ament_cmake_python,
  ament_cmake_target_dependencies,
  ament_cmake_test,
  ament_cmake_version,
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake = substituteSource {
      src = fetchgit {
        name = "ament_cmake-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "a2e1728b11398842481cf32bdb6c9b2aa5101971";
        hash = "sha256-W1kb8wclhD6toFjE2TWqbWnFUut+Ccg1vqBKp5e4sYs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake";
  version = "2.0.5-1";
  src = sources.ament_cmake;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake_core ament_cmake_export_definitions ament_cmake_export_dependencies ament_cmake_export_include_directories ament_cmake_export_interfaces ament_cmake_export_libraries ament_cmake_export_link_flags ament_cmake_export_targets ament_cmake_gen_version_h ament_cmake_libraries ament_cmake_python ament_cmake_target_dependencies ament_cmake_test ament_cmake_version cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_cmake_core ament_cmake_export_definitions ament_cmake_export_dependencies ament_cmake_export_include_directories ament_cmake_export_interfaces ament_cmake_export_libraries ament_cmake_export_link_flags ament_cmake_export_targets ament_cmake_gen_version_h ament_cmake_libraries ament_cmake_python ament_cmake_target_dependencies ament_cmake_test ament_cmake_version cmake ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
