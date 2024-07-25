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
        rev = "24cd844a5e257ed258c1405222228d6853207ddb";
        hash = "sha256-oPOvzdCvpgKWrrKen3b6KXavLVFaN8rcRzEHNElKGD8=";
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
  version = "1.6.0-4";
  src = sources.console_bridge_vendor;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ console-bridge ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
