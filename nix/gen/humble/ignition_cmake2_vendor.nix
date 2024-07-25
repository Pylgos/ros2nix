{
  ament_cmake_copyright,
  ament_cmake_lint_cmake,
  ament_cmake_test,
  ament_cmake_xmllint,
  buildRosPackage,
  cmake,
  doxygen,
  fetchgit,
  fetchurl,
  fetchzip,
  git,
  substituteSource,
}:
let
  sources = rec {
    ignition_cmake2_vendor = substituteSource {
      src = fetchgit {
        name = "ignition_cmake2_vendor-source";
        url = "https://github.com/ros2-gbp/ignition_cmake2_vendor-release.git";
        rev = "18bf27798d4be2ba4a85e9e9fb129681e4e7af2b";
        hash = "sha256-bZxidfrsqkCbbKbqdgbiC7SuwHBPMfR+/87ZeJpKzZY=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/ignitionrobotics/ign-cmake.git";
          to = "URL ${ignition_cmake2_vendor-vendor_source-ign-cmake-0}";
        }
      ];
    };
    ignition_cmake2_vendor-vendor_source-ign-cmake-0 = substituteSource {
      src = fetchgit {
        name = "ignition_cmake2_vendor-vendor_source-ign-cmake-0-source";
        url = "https://github.com/ignitionrobotics/ign-cmake.git";
        rev = "44a699cf4be75254ca9bf2a0a5cfa25369e0ccb4";
        hash = "sha256-oCnSYhbGES09TZ9lpGp5jHib0IvNQ8dNti+m2YcQH30=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ignition_cmake2_vendor";
  version = "0.0.2-2";
  src = sources.ignition_cmake2_vendor;
  nativeBuildInputs = [ ament_cmake_test cmake doxygen git ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
