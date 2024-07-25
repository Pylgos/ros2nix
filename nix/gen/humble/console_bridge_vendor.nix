{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  console-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  performance_test_fixture,
  substituteSource,
}:
let
  sources = rec {
    console_bridge_vendor = substituteSource {
      src = fetchgit {
        name = "console_bridge_vendor-source";
        url = "https://github.com/ros2-gbp/console_bridge_vendor-release.git";
        rev = "365230890ff7502a0bb63ef4ae3f23d444dddd2a";
        hash = "sha256-lgsqEU/ZyaZfte3s7Mz+RKYl2uUUl4DmbGxEih952r8=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "URL https://github.com/ros/console_bridge/archive/1.0.2.tar.gz";
          to = "URL ${console_bridge_vendor-vendor_source-1-0}";
        }
      ];
    };
    console_bridge_vendor-vendor_source-1-0 = substituteSource {
      src = fetchzip {
        name = "console_bridge_vendor-vendor_source-1-0-source";
        url = "https://github.com/ros/console_bridge/archive/1.0.2.tar.gz";
        hash = "sha256-M3GocT0hodw3Sc2NHcFDiPVZ1XN7BqIUuYLW8OaXMqM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "console_bridge_vendor";
  version = "1.4.1-1";
  src = sources.console_bridge_vendor;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ console-bridge ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
